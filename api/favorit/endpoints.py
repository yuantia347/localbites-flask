from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity
from helper.db_helper import get_connection

favorit_endpoints = Blueprint("favorit", __name__)

# ✅ CREATE FAVORIT
@favorit_endpoints.route('/create', methods=['POST', 'OPTIONS'])
@jwt_required()
def add_favorit():
    if request.method == 'OPTIONS':
        return '', 200

    user_id = get_jwt_identity()
    data = request.get_json()
    tipe_favorit = data.get('tipe_favorit')
    item_id = data.get('item_id')

    if not tipe_favorit or not item_id:
        return jsonify({"status": "error", "message": "Data tidak lengkap"}), 400

    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO favorit (user_id, tipe_favorit, item_id)
            VALUES (%s, %s, %s)
            ON DUPLICATE KEY UPDATE created_at = NOW()
        """, (user_id, tipe_favorit, item_id))
        conn.commit()
        return jsonify({"status": "success", "message": "Ditambahkan ke favorit"}), 201
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        conn.close()

# ✅ DELETE FAVORIT
@favorit_endpoints.route('/delete', methods=['DELETE', 'OPTIONS'])
@jwt_required()
def delete_favorit():
    if request.method == 'OPTIONS':
        return '', 200

    user_id = get_jwt_identity()
    data = request.get_json()
    tipe_favorit = data.get('tipe_favorit')
    item_id = data.get('item_id')

    if not tipe_favorit or not item_id:
        return jsonify({"status": "error", "message": "Data tidak lengkap"}), 400

    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("""
            DELETE FROM favorit
            WHERE user_id = %s AND tipe_favorit = %s AND item_id = %s
        """, (user_id, tipe_favorit, item_id))
        conn.commit()
        return jsonify({"status": "success", "message": "Berhasil dihapus dari favorit"}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        conn.close()

# ✅ GET FAVORIT
@favorit_endpoints.route('', methods=['GET', 'OPTIONS'])
@jwt_required()
def get_favorit():
    if request.method == 'OPTIONS':
        return '', 200

    user_id = get_jwt_identity()

    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM favorit WHERE user_id = %s", (user_id,))
        results = cursor.fetchall()
        return jsonify({"status": "success", "data": results}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        cursor.close()
        conn.close()
