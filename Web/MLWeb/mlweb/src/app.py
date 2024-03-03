import os
import secrets

from flask import Flask
from werkzeug.security import generate_password_hash

from utils.models import db, UserModel, OptimizedModel
from utils.config import Config
from routes import bp_admin, bp_auth, bp_user


app = Flask(__name__, static_url_path='/static/', static_folder='assets')
app.config.from_object(Config)
db.init_app(app)


if __name__ == '__main__':
    with app.app_context():
        app.register_blueprint(bp_admin)
        app.register_blueprint(bp_auth)
        app.register_blueprint(bp_user)
        db.create_all()

        with open(f"flag_{secrets.token_hex()}.txt", "w") as flag_file:
            flag_file.write(os.getenv("FLAG", "GCC{FAKE_FLAG}"))

        if not UserModel.query.filter_by(username="admin").first():
            admin_user = UserModel(id=1, username="admin", password=generate_password_hash(Config.ADMIN_PASSWORD))
            db.session.add(admin_user)
            db.session.commit()

            file_name = "example_model.zip"
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], file_name)
            model = OptimizedModel(id=1, name=file_name, file_path=file_path, user_id=1)
            db.session.add(model)
            db.session.commit()

    app.run(host="0.0.0.0", port=5000, debug=False)
