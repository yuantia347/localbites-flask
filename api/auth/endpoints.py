from flask import Blueprint, jsonify, request
from flask_jwt_extended import create_access_token, decode_token
from flask_bcrypt import Bcrypt
from helper.db_helper import get_connection

bcrypt = Bcrypt()
auth_endpoints = Blueprint('auth', __name__)


@auth_endpoints.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    if not username or not password:
        return jsonify({"msg": "Username and password are required"}), 400

    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    query = "SELECT * FROM users WHERE username = %s AND deleted_at IS NULL"
    cursor.execute(query, (username,))
    user = cursor.fetchone()
    cursor.close()

    if not user or not bcrypt.check_password_hash(user.get('password'), password):
        return jsonify({"msg": "Bad username or password"}), 401

    access_token = create_access_token(
        identity=str(user['id_users']),
        additional_claims={"username": username}
    )

    decoded_token = decode_token(access_token)
    expires = decoded_token['exp']

    return jsonify({
        "access_token": access_token,
        "expires_in": expires,
        "type": "Bearer",
        "user_id": user['id_users']  # ✅ tambahkan ini!
    }), 200


@auth_endpoints.route('/register', methods=['POST'])
def register():
    """Route for user registration"""
    username = request.form['username']
    password = request.form['password']
    hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')

    connection = get_connection()
    cursor = connection.cursor()
    insert_query = "INSERT INTO users (username, password) values (%s, %s)"
    cursor.execute(insert_query, (username, hashed_password))
    connection.commit()
    new_id = cursor.lastrowid
    cursor.close()

    if new_id:
        return jsonify({
            "message": "OK",
            "description": "User created",
            "username": username,
            "id_users": new_id
        }), 201

    return jsonify({"message": "Failed, can't register user"}), 501
