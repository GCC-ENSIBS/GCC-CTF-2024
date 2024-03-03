from flask import Flask, redirect, url_for, abort, request, json, Blueprint, Response

from pathlib import Path
import shutil

from shared import abort_check_path, abort_check_session, NOTE_DIR

bp_api = Blueprint("api", __file__, url_prefix="/api")

@bp_api.route("/session")
def new_session():
    import uuid
    sessid = str(uuid.uuid4())
    Path(NOTE_DIR, sessid).mkdir()

    return json.jsonify(sessid)


@bp_api.route("/notes/<path:sessid>", methods=["GET", "POST"])
def list_notes(sessid):
    session_dir = abort_check_session(sessid)

    if request.method == "POST":
        for uploaded_file in request.files:
            abort_check_path(uploaded_file)

            upload_path = session_dir.joinpath(uploaded_file)
            try:
                request.files[uploaded_file].save(upload_path)
            except OSError:
                abort(500)


    files_list = [str(p.name) for p in session_dir.glob("*")]
    return json.jsonify(files_list)


@bp_api.route("/notes/<path:sessid>/<path:noteid>")
def get_note(sessid, noteid):
    session_dir = abort_check_session(sessid)

    response = Response()
    try:
        with open(session_dir.joinpath(noteid), "r") as f:
            content = f.read()
        response.headers["Content-Type"] = "text/plain"
    except UnicodeDecodeError:
        with open(session_dir.joinpath(noteid), "rb") as f:
            content = f.read()
        response.headers["Content-Type"] = "application/octet-stream"

    response.set_data(content)
    return response

