from typing import List

from fastapi import FastAPI, File, UploadFile, status
from fastapi.responses import HTMLResponse


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

@app.post("/files/")
async def create_file(files: List[bytes] = File(..., description="A file read as bytes")):
    print(files)
    return {"file_sizes": [len(file) for file in files]}


@app.post("/uploadfile/")
async def create_upload_file(
    files: List[UploadFile] = File(..., description="A file read as UploadFile")
):
    return {"filenames": [file.filename for file in files]}

@app.get("/")
async def main():
    content = """
<body>
<form action="/files/" enctype="multipart/form-data" method="post">
<input name="files" type="file" multiple>
<input type="submit">
</form>
<form action="/uploadfiles/" enctype="multipart/form-data" method="post">
<input name="files" type="file" multiple>
<input type="submit">
</form>
</body>
    """
    return HTMLResponse(content=content)

