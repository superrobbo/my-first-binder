from typing import Optional
from fastapi import FastAPI
from pydantic import BaseModel
app = FastAPI()

class Item(BaseModel):
    name: str
    price: float
    is_offer: Optional[bool] = None
   
class User(BaseModel):
    id: int
    name: str
    joined: date
        
@app.get('/')
def readRoot():
    return {"Hello": "World"}

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
    
