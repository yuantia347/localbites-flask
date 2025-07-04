import os
from flask import Flask
from flask_cors import CORS
from dotenv import load_dotenv
from flask_jwt_extended import JWTManager
from flasgger import Swagger

# Import blueprint endpoint
from api.auth.endpoints import auth_endpoints
from api.resep_masakan.endpoints import resep_endpoints
from api.rekomendasi_sosmed.endpoints import rekomendasi_endpoints
from api.data_protected.endpoints import protected_endpoints
from static.static_file_server import static_file_server

# Load .env file
load_dotenv()

# Inisialisasi Flask App
app = Flask(__name__)
app.config['JWT_SECRET_KEY'] = os.getenv("JWT_SECRET_KEY", "secret_default")
app.config['UPLOAD_FOLDER'] = "img"

# CORS & JWT
CORS(app)
jwt = JWTManager(app)

# Swagger (dokumentasi API)
swagger = Swagger(app)

# Registrasi blueprint
app.register_blueprint(auth_endpoints, url_prefix="/api/v1/auth")
app.register_blueprint(resep_endpoints, url_prefix="/api/v1/resep")
app.register_blueprint(protected_endpoints, url_prefix="/api/v1/protected")
app.register_blueprint(static_file_server, url_prefix="/img")
app.register_blueprint(rekomendasi_endpoints, url_prefix='/api/v1/rekomendasi')

# Root route
@app.route('/')
def index():
    return {"message": "Welcome to Flask Resep Masakan API"}, 200

# Run app
if __name__ == "__main__":
    app.run(debug=True)
