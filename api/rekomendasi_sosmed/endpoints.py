import os
from flask import Blueprint, jsonify, request
from flask_jwt_extended import jwt_required, get_jwt_identity
from helper.db_helper import get_connection
from datetime import datetime
from flasgger import swag_from

sosmed_endpoints = Blueprint('rekomendasi_sosmed', __name__)

def default_datetime_handler(obj):
    if isinstance(obj, datetime):
        return obj.isoformat()
    raise TypeError("Type not serializable")

# READ
@sosmed_endpoints.route('/read', methods=['GET'])
@swag_from('docs/read_sosmed.yml')
def read_sosmed():
    try:
        connection = get_connection()
        cursor = connection.cursor(dictionary=True)
        cursor.execute("""
            SELECT rs.*, u.username 
            FROM rekomendasi_sosmed rs
            JOIN users u ON rs.created_by = u.id_users
            WHERE rs.deleted_at IS NULL
        """)
        results = cursor.fetchall()
        return jsonify({"status": "success", "data": results}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        connection.close()

# CREATE
@sosmed_endpoints.route('/create', methods=['POST', 'OPTIONS'])
@jwt_required()
def create_sosmed():
    if request.method == "OPTIONS":
        return '', 200

    current_user = get_jwt_identity()

    # ✅ Ambil dari FormData
    judul = request.form.get("judul")
    link = request.form.get("link")
    deskripsi = request.form.get("deskripsi")
    thumbnail_url = request.form.get("thumbnail_url")

    if not all([judul, link, deskripsi]):
        return jsonify({"status": "error", "message": "Judul, link, dan deskripsi wajib diisi"}), 400

    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute("""
            INSERT INTO rekomendasi_sosmed (judul, link, deskripsi, thumbnail_url, created_by, created_at)
            VALUES (%s, %s, %s, %s, %s, NOW())
        """, (judul, link, deskripsi, thumbnail_url, current_user))
        connection.commit()
        new_id = cursor.lastrowid
        return jsonify({"status": "success", "message": "Rekomendasi berhasil ditambahkan", "id_sosmed": new_id}), 201
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        connection.close()

# UPDATE
@sosmed_endpoints.route('/update/<int:id_sosmed>', methods=['PUT', 'OPTIONS'])
@jwt_required()
def update_sosmed(id_sosmed):
    if request.method == "OPTIONS":
        return '', 200

    current_user = get_jwt_identity()
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute("SELECT created_by FROM rekomendasi_sosmed WHERE id_sosmed = %s", (id_sosmed,))
    result = cursor.fetchone()

    if not result or int(result["created_by"]) != int(current_user):
        return jsonify({"status": "error", "message": "Tidak diizinkan"}), 403

    # ✅ Ambil dari FormData
    judul = request.form.get("judul")
    link = request.form.get("link")
    deskripsi = request.form.get("deskripsi")
    thumbnail_url = request.form.get("thumbnail_url")

    if not all([judul, link, deskripsi]):
        return jsonify({"status": "error", "message": "Judul, link, dan deskripsi wajib diisi"}), 400

    try:
        cursor.execute("""
            UPDATE rekomendasi_sosmed
            SET judul = %s, link = %s, deskripsi = %s, thumbnail_url = %s, updated_at = NOW()
            WHERE id_sosmed = %s
        """, (judul, link, deskripsi, thumbnail_url, id_sosmed))
        connection.commit()
        return jsonify({"status": "success", "message": "Rekomendasi berhasil diubah", "id_sosmed": id_sosmed}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        connection.close()

# DELETE
@sosmed_endpoints.route('/delete/<int:id_sosmed>', methods=['DELETE', 'OPTIONS'])
@jwt_required()
def delete_sosmed(id_sosmed):
    if request.method == "OPTIONS":
        return '', 200

    current_user = get_jwt_identity()
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute("SELECT created_by FROM rekomendasi_sosmed WHERE id_sosmed = %s", (id_sosmed,))
    result = cursor.fetchone()

    if not result or int(result["created_by"]) != int(current_user):
        return jsonify({"status": "error", "message": "Tidak diizinkan"}), 403

    try:
        cursor.execute("UPDATE rekomendasi_sosmed SET deleted_at = NOW() WHERE id_sosmed = %s", (id_sosmed,))
        connection.commit()
        return jsonify({"status": "success", "message": "Rekomendasi berhasil dihapus"}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        connection.close()
