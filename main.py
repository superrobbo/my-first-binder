from typing import Optional
from fastapi import FastAPI
from pydantic import BaseModel
from datetime import date

from enum import Enum

app = FastAPI()

class Item(BaseModel):
    name: str
    price: float
    is_offer: Optional[bool] = None
    
class ModelName(str,Enum):
    alexnet = "alexnet"
    resnet = "resnet"
    lenet = "lenet"
   
class User(BaseModel):
    id: int
    name: str
    joined: date
        
@app.get('/')
def readRoot():
    return {"Hello": "World"}

@app.get("/users/me")
async def read_user_me():
    return {"user_id": "the current user"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}

@app.put("/item/{item_id}")
def uodate_item(item_id: int, item: Item):
    return {"item_name": item.name, "item_id":item_id}


my_user: User = User(id=3, name="John Doe", joined="2018-07-19")

@app.get("/users/{user_id}")
def read_user(user_id: int):
    return {"user_id": user_id,"user_name": my_user.name} 
    
@app.get("/models/{model_name}")
async def get_model(model_name: ModelName):
    if model_name == ModelName.alexnet:
        return {"model_name": model_name, "message": "Deep Learning FTW!"}

    if model_name.value == "lenet":
        return {"model_name": model_name, "message": "LeCNN all the images"}

    return {"model_name": model_name, "message": "Have some residuals"}

@app.get("files/{file_path:path}")
async def read_file(file_path: str):
    return {"file_path": file_path}
    
