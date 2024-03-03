from flask import abort
from pathlib import Path

NOTE_DIR = Path("/app/notes")

def check_path(path: str):
    return ".." not in path

def abort_check_path(path: str):
    if not check_path(path):
        abort(418)

def check_session(sessid: str) -> Path:
    if not check_path(sessid):
        return None

    session_dir = Path(NOTE_DIR, sessid)
    if not session_dir.is_dir() or not session_dir.parent.is_dir():
        return None

    return session_dir

def abort_check_session(sessid: str) -> Path:
    ret = check_session(sessid)
    if ret is None:
        abort(404)

    return ret

def list_notes(sessid: str) -> list:
    session_dir = check_session(sessid)
    if session_dir is None:
        return []
    
    return [str(p.name) for p in session_dir.glob("*")]
