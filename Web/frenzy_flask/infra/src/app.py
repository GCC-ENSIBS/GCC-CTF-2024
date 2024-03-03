from flask import Flask, url_for, request, render_template

from pathlib import Path
import shutil
import uuid

from api import bp_api
from shared import abort_check_session, NOTE_DIR, list_notes

app = Flask(__name__, template_folder="./templates")
DEBUG = True

@app.route("/")
@app.route("/notes/<path:sessid>")
def index(sessid=None):
    notes = []
    if sessid:
        abort_check_session(sessid)
        notes = list_notes(sessid)

    return render_template("index.html", sessid=sessid, notes=notes)

if __name__ == "__main__":
    d = Path(NOTE_DIR)
    # if d.exists():
        # shutil.rmtree(NOTE_DIR)
    Path(NOTE_DIR).mkdir(exist_ok=True)

    app.register_blueprint(bp_api)
    app.run("0.0.0.0", 5000, debug=DEBUG)


