from fastapi import FastAPI, Form, File, UploadFile, status

app = FastAPI()


@app.post("/items/{name}", status_code=status.HTTP_201_CREATED)
async def create_item(name: str):
    return {"name": name}

@app.post("/login/")
async def login(username: str = Form(...), password: str = Form(...)):
    return {"username": username}

@app.post("/files/")
async def create_files(file: bytes = File(...)):
    return len(file)

@app.post("/uploadfile/")
async def create_upload_file(file: UploadFile):
    return {"filename": file.filename}
