from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity
from helper.db_helper import get_connection
from datetime import datetime

usaha_endpoints = Blueprint('usaha_kuliner', __name__)

@usaha_endpoints.route('/read', methods=['GET'])
def read_usaha():
    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT u.*, us.username 
            FROM usaha_kuliner u
            JOIN users us ON u.user_id = us.id_users
            WHERE u.status_approve = TRUE
        """)
        results = cursor.fetchall()
        return jsonify({"status": "success", "data": results}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        conn.close()

@usaha_endpoints.route('/read/<int:usaha_id>', methods=['GET'])
def detail_usaha(usaha_id):
    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM usaha_kuliner WHERE id = %s", (usaha_id,))
        usaha = cursor.fetchone()

        if not usaha:
            return jsonify({"status": "error", "message": "Usaha tidak ditemukan"}), 404

        return jsonify({"status": "success", "data": usaha}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        conn.close()

@usaha_endpoints.route('/create', methods=['POST', 'OPTIONS'])
@jwt_required()
def create_usaha():
    if request.method == 'OPTIONS':
        return '', 200

    current_user = get_jwt_identity()
    user_id = current_user['id_users'] if isinstance(current_user, dict) else current_user

    data = request.form or request.json
    nama_usaha = data.get("nama_usaha")
    deskripsi = data.get("deskripsi", "")
    lokasi = data.get("lokasi", "")
    kontak = data.get("kontak", "")
    foto = data.get("foto", "")
    jam_buka = data.get("jam_buka", "")

    if not nama_usaha:
        return jsonify({"status": "error", "message": "Nama usaha wajib diisi"}), 400

    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO usaha_kuliner 
            (user_id, nama_usaha, deskripsi, lokasi, kontak, foto, jam_buka)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (user_id, nama_usaha, deskripsi, lokasi, kontak, foto, jam_buka))
        conn.commit()
        return jsonify({"status": "success", "message": "Usaha berhasil ditambahkan"}), 201
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        conn.close()

@usaha_endpoints.route('/update/<int:usaha_id>', methods=['PUT', 'OPTIONS'])
@jwt_required()
def update_usaha(usaha_id):
    if request.method == 'OPTIONS':
        return '', 200

    current_user = get_jwt_identity()
    user_id = current_user['id_users'] if isinstance(current_user, dict) else current_user

    data = request.form or request.json
    nama_usaha = data.get("nama_usaha")
    deskripsi = data.get("deskripsi", "")
    lokasi = data.get("lokasi", "")
    kontak = data.get("kontak", "")
    foto = data.get("foto", "")
    jam_buka = data.get("jam_buka", "")

    if not nama_usaha:
        return jsonify({"status": "error", "message": "Nama usaha wajib diisi"}), 400

    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT user_id FROM usaha_kuliner WHERE id = %s", (usaha_id,))
    usaha = cursor.fetchone()

    if not usaha or int(usaha["user_id"]) != int(user_id):
        return jsonify({"status": "error", "message": "Tidak diizinkan"}), 403

    try:
        cursor.execute("""
            UPDATE usaha_kuliner SET 
            nama_usaha=%s, deskripsi=%s, lokasi=%s, kontak=%s,
            foto=%s, jam_buka=%s, updated_at=NOW()
            WHERE id=%s
        """, (nama_usaha, deskripsi, lokasi, kontak, foto, jam_buka, usaha_id))
        conn.commit()
        return jsonify({"status": "success", "message": "Usaha berhasil diperbarui"}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        conn.close()

@usaha_endpoints.route('/delete/<int:usaha_id>', methods=['DELETE', 'OPTIONS'])
@jwt_required()
def delete_usaha(usaha_id):
    if request.method == 'OPTIONS':
        return '', 200

    current_user = get_jwt_identity()
    user_id = current_user['id_users'] if isinstance(current_user, dict) else current_user

    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT user_id FROM usaha_kuliner WHERE id = %s", (usaha_id,))
    usaha = cursor.fetchone()

    if not usaha or int(usaha["user_id"]) != int(user_id):
        return jsonify({"status": "error", "message": "Tidak diizinkan"}), 403

    try:
        cursor.execute("DELETE FROM usaha_kuliner WHERE id = %s", (usaha_id,))
        conn.commit()
        return jsonify({"status": "success", "message": "Usaha berhasil dihapus"}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        conn.close()