from fastapi import FastAPI, HTTPException, Request
from fastapi.responses import HTMLResponse
from timosbadlibraries.RSAServer import Server
from pydantic import BaseModel
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from api import Api
from flag import FLAG

app = FastAPI()
serv = Server()
api = Api()

templates = Jinja2Templates(directory="templates")
app.mount("/static", StaticFiles(directory="static"), name="static")

# disable docs
app.redoc_url = None
app.swagger_ui_operation_id = None
app.swagger_ui_request_validation = None
app.swagger_ui_response_validation = None
app.swagger_ui_oauth2_redirect_url = None
app.openapi_url = None
app.docs_url = None

class ChangeRSAKey(BaseModel):
    reason: str

class SendSecret(BaseModel):
    secret: str

class ConnectionInfos(BaseModel):
    username: str
    password: str


## app HTML routes

# homepage
@app.get("/", response_class=HTMLResponse)
async def root(request: Request):
    return templates.TemplateResponse(
        request=request, name="index.html", context={"title": "Home", "header_title": "Welcome to Secret Sender"}
    )

# about
@app.get("/about", response_class=HTMLResponse)
async def about(request: Request):
    return templates.TemplateResponse(
        request=request, name="about.html", context={"title": "About", "header_title": "About"}
    )

# contact
@app.get("/contact", response_class=HTMLResponse)
async def contact(request: Request):
    return templates.TemplateResponse(
        request=request, name="contact.html", context={"title": "Contact", "header_title": "Contact"}
    )

# login
@app.get("/login", response_class=HTMLResponse)
async def login(request: Request):
    return templates.TemplateResponse(
        request=request, name="login.html", context={"title": "Login", "header_title": "Login"}
    )

# get_secret
@app.get("/get_secret", response_class=HTMLResponse)
async def get_secret(request: Request):
    return templates.TemplateResponse(
        request=request, name="get_secret.html", context={"title": "My Secret", "header_title": "Do you want my secret ?"}
    )

# send secret
@app.get("/send_secret", response_class=HTMLResponse)
async def send_secret(request: Request):
    return templates.TemplateResponse(
        request=request, name="send_secret.html", context={"title": "Send Secret", "header_title": "Send a secret"}
    )


## API routes

# get public key
@app.get("/get/public_key")
async def get_public_key():
    try:
        pubkey = serv.get_public_key()
        return {"public_key": {"n": str(int.from_bytes(pubkey[0])), "e": str(int.from_bytes(pubkey[1]))}}
    except:
        # raise server error
        raise HTTPException(status_code=500, detail="An error occured while getting public key")
    
# get flag 
@app.get("/get/secret")
async def get_flag(user_id: int, token: str):   
    try:
        if user_id == api.get_user_level("admin") and api.is_valid_token(token):
            return {"secret": str(serv.encrypt(FLAG)), "message": "But it may be encrypted :)"}
        else:
            # raise unauthorized
            raise HTTPException(status_code=403, detail="Unauthorized")
    except:
        # raise server error
        raise HTTPException(status_code=500, detail="An error occured while getting secret")

@app.put("/put/change_key")
async def change_key(reason: ChangeRSAKey):
    try:
        serv.change_key(reason.reason)
        return {"success": True}
    except:
        # raise server error
        raise HTTPException(status_code=500, detail="An error occured while changing key")

## app user routes

# get user level
@app.get("/get/user_rights/{user}")
async def get_user_level(user: str, token: str):
    try:
        if token != "anonymous":
            # raise unauthorized
            raise HTTPException(status_code=403, detail="Unauthorized")
        return {"user_rights": str(api.get_user_level(user))}
    except:
        # raise server error
        raise HTTPException(status_code=500, detail="An error occured while getting user rights")

# connect
@app.post("/connect")
async def connect(connection_infos: ConnectionInfos):
    try:
        if connection_infos.username == "anonymous":
            return {"token": "anonymous"}
        # raise unauthorized
        raise HTTPException(status_code=401, detail="User not found or wrong password")
    except:
        # raise server error
        raise HTTPException(status_code=500, detail="An error occured while connecting")

@app.post("/send_secret")
async def send_secret(secret: SendSecret):
    return {"received": "ok"}


# redirect everything else to 404
@app.get("/{path:path}")
async def catch_all(path: str):
    raise HTTPException(status_code=404, detail="Page not found")

## Error handlers

# 404
@app.exception_handler(404)
async def not_found(request: Request, exc):
    return templates.TemplateResponse(
        request=request, name="404.html", context={"title": "404", "header_title": "Error 404"}
    )

# 500
@app.exception_handler(500)
async def server_error(request: Request, exc):
    print(exc)
    return templates.TemplateResponse(
        request=request, name="500.html", context={"title": "500", "header_title": "Error 500"}
    )