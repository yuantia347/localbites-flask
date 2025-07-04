import os
from flask import Blueprint, jsonify, request
from flask_jwt_extended import jwt_required, get_jwt_identity
from helper.db_helper import get_connection
from datetime import datetime
from flasgger import swag_from

rekomendasi_endpoints = Blueprint('rekomendasi_sosmed', __name__)

def default_datetime_handler(obj):
    if isinstance(obj, datetime):
        return obj.isoformat()
    raise TypeError("Type not serializable")

@rekomendasi_endpoints.route('/read', methods=['GET'])
@swag_from('docs/read_rekomendasi.yml')
def read_rekomendasi():
    try:
        connection = get_connection()
        cursor = connection.cursor(dictionary=True)
        cursor.execute("""
            SELECT r.*, u.username 
            FROM rekomendasi_sosmed r
            JOIN users u ON r.created_by = u.id_users
            WHERE r.deleted_at IS NULL
        """)
        results = cursor.fetchall()
        return jsonify({"status": "success", "data": results}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        connection.close()

@rekomendasi_endpoints.route('/create', methods=['POST', 'OPTIONS'])
@jwt_required()
def create_rekomendasi():
    if request.method == "OPTIONS":
        return '', 200

    current_user = get_jwt_identity()
    data = request.form or request.json

    judul = data.get("judul")
    link = data.get("link")
    deskripsi = data.get("deskripsi", "")
    thumbnail_url = data.get("thumbnail_url", "")

    if not all([judul, link]):
        return jsonify({"status": "error", "message": "Judul dan link wajib diisi"}), 400

    connection = get_connection()
    cursor = connection.cursor()
    cursor.execute("""
        INSERT INTO rekomendasi_sosmed (judul, link, deskripsi, thumbnail_url, created_by, created_at)
        VALUES (%s, %s, %s, %s, %s, NOW())
    """, (judul, link, deskripsi, thumbnail_url, current_user))
    connection.commit()
    new_id = cursor.lastrowid
    cursor.close()
    connection.close()

    return jsonify({"status": "success", "message": "Rekomendasi berhasil ditambahkan", "id_rekomendasi": new_id}), 201

@rekomendasi_endpoints.route('/update/<int:rekomendasi_id>', methods=['PUT', 'OPTIONS'])
@jwt_required()
def update_rekomendasi(rekomendasi_id):
    if request.method == "OPTIONS":
        return '', 200

    current_user = get_jwt_identity()
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT created_by FROM rekomendasi_sosmed WHERE id = %s", (rekomendasi_id,))
    rekom = cursor.fetchone()

    if not rekom or rekom["created_by"] != current_user:
        return jsonify({"status": "error", "message": "Tidak diizinkan"}), 403

    data = request.form or request.json
    judul = data.get("judul")
    link = data.get("link")
    deskripsi = data.get("deskripsi")
    thumbnail_url = data.get("thumbnail_url")

    if not all([judul, link]):
        return jsonify({"status": "error", "message": "Judul dan link wajib diisi"}), 400

    cursor.execute("""
        UPDATE rekomendasi_sosmed 
        SET judul=%s, link=%s, deskripsi=%s, thumbnail_url=%s, updated_at=NOW()
        WHERE id=%s
    """, (judul, link, deskripsi, thumbnail_url, rekomendasi_id))
    connection.commit()
    cursor.close()
    connection.close()

    return jsonify({"status": "success", "message": "Rekomendasi berhasil diubah", "id_rekomendasi": rekomendasi_id}), 200

@rekomendasi_endpoints.route('/delete/<int:rekomendasi_id>', methods=['DELETE', 'OPTIONS'])
@jwt_required()
def delete_rekomendasi(rekomendasi_id):
    if request.method == "OPTIONS":
        return '', 200

    current_user = get_jwt_identity()
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT created_by FROM rekomendasi_sosmed WHERE id = %s", (rekomendasi_id,))
    rekom = cursor.fetchone()

    if not rekom or rekom["created_by"] != current_user:
        return jsonify({"status": "error", "message": "Tidak diizinkan"}), 403

    cursor.execute("DELETE FROM rekomendasi_sosmed WHERE id = %s", (rekomendasi_id,))
    connection.commit()
    cursor.close()
    connection.close()

    return jsonify({"status": "success", "message": "Rekomendasi berhasil dihapus", "id_rekomendasi": rekomendasi_id}), 200
