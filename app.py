from flask import Flask
from flask_cors import CORS
from dotenv import load_dotenv
from extensions import jwt
from api.auth.endpoints import auth_endpoints
from api.data_protected.endpoints import protected_endpoints
from config import Config
from static.static_file_server import static_file_server
from flasgger import Swagger

load_dotenv()

app = Flask(__name__)
app.config.from_object(Config)

# ✅ CORS konfigurasi eksplisit
CORS(app, resources={r"/api/*": {"origins": "http://localhost:5173"}}, supports_credentials=True)

Swagger(app)
jwt.init_app(app)

app.register_blueprint(auth_endpoints, url_prefix='/api/v1/auth')
app.register_blueprint(protected_endpoints, url_prefix='/api/v1/protected')
app.register_blueprint(static_file_server, url_prefix='/static/')

if __name__ == '__main__':
    app.run(debug=True)
