import os
from flask import Blueprint, jsonify, request
from flask_jwt_extended import jwt_required, get_jwt_identity
from helper.db_helper import get_connection
from helper.form_validation import get_form_data
from werkzeug.utils import secure_filename
from datetime import datetime
from flasgger import swag_from

resep_endpoints = Blueprint('resep_masakan', __name__)
UPLOAD_FOLDER = "img"

def default_datetime_handler(obj):
    if isinstance(obj, datetime):
        return obj.isoformat()
    raise TypeError("Type not serializable")

@resep_endpoints.route('/read', methods=['GET'])
@swag_from('docs/read_resep.yml')
def read_resep():
    try:
        connection = get_connection()
        cursor = connection.cursor(dictionary=True)
        cursor.execute("""
            SELECT r.*, u.username 
            FROM resep_masakan r
            JOIN users u ON r.user_id = u.id_users
        """)
        results = cursor.fetchall()
        return jsonify({"status": "success", "data": results}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        connection.close()

@resep_endpoints.route('/create', methods=['POST', 'OPTIONS'])
@jwt_required()
def create_resep():
    if request.method == "OPTIONS":
        return '', 200

    current_user = get_jwt_identity()
    data = request.form or request.json

    judul = data.get("judul")
    bahan = data.get("bahan")
    langkah = data.get("langkah")
    kategori = data.get("kategori", "")
    foto = data.get("foto")  # string URL instead of file upload

    if not all([judul, bahan, langkah]):
        return jsonify({"status": "error", "message": "Judul, bahan, dan langkah wajib diisi"}), 400

    connection = get_connection()
    cursor = connection.cursor()
    cursor.execute("""
        INSERT INTO resep_masakan (user_id, judul, bahan, langkah, kategori, foto, created_at)
        VALUES (%s, %s, %s, %s, %s, %s, NOW())
    """, (current_user, judul, bahan, langkah, kategori, foto))
    connection.commit()
    new_id = cursor.lastrowid
    cursor.close()
    connection.close()

    return jsonify({"status": "success", "message": "Resep berhasil ditambahkan", "id_resep": new_id}), 201

@resep_endpoints.route('/update/<int:resep_id>', methods=['PUT', 'OPTIONS'])
@jwt_required()
def update_resep(resep_id):
    if request.method == "OPTIONS":
        return '', 200

    current_user = get_jwt_identity()
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    # Ambil user_id dari resep
    cursor.execute("SELECT user_id FROM resep_masakan WHERE id = %s", (resep_id,))
    resep = cursor.fetchone()

    # Bandingkan setelah dikonversi ke int
    if not resep or int(resep["user_id"]) != int(current_user):
        return jsonify({"status": "error", "message": "Tidak diizinkan"}), 403

    # Ambil data update
    data = request.form or request.json
    judul = data.get("judul")
    bahan = data.get("bahan")
    langkah = data.get("langkah")
    kategori = data.get("kategori")
    foto = data.get("foto")

    # Validasi data
    if not all([judul, bahan, langkah]):
        return jsonify({"status": "error", "message": "Judul, bahan, dan langkah wajib diisi"}), 400

    # Proses update
    cursor.execute("""
        UPDATE resep_masakan 
        SET judul=%s, bahan=%s, langkah=%s, kategori=%s, foto=%s, updated_at=NOW()
        WHERE id=%s
    """, (judul, bahan, langkah, kategori, foto, resep_id))

    connection.commit()
    cursor.close()
    connection.close()

    return jsonify({"status": "success", "message": "Resep berhasil diubah", "id_resep": resep_id}), 200


@resep_endpoints.route('/delete/<int:resep_id>', methods=['DELETE', 'OPTIONS'])
@jwt_required()
def delete_resep(resep_id):
    if request.method == "OPTIONS":
        return '', 200

    current_user = get_jwt_identity()
    print("current_user JWT:", current_user)  # DEBUG

    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT user_id FROM resep_masakan WHERE id = %s", (resep_id,))
    resep = cursor.fetchone()

    print("user_id resep:", resep)  # DEBUG

    # FIX: Samakan tipe data saat perbandingan
    if not resep or int(resep["user_id"]) != int(current_user):
        return jsonify({"status": "error", "message": "Tidak diizinkan"}), 403

    cursor.execute("DELETE FROM resep_masakan WHERE id = %s", (resep_id,))
    connection.commit()

    return jsonify({"status": "success", "message": "Resep berhasil dihapus"}), 200

from flask import jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity
from helper.db_helper import get_connection
