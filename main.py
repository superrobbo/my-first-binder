from typing import Optional
from fastapi import FastAPI
from pydantic import BaseModel
app = FastAPI()

class Item(BaseModel):
    name: str
    price: float
    is_offer: Optional[bool] = None
        
@app.get('/')
def readRoot():
    return {"Hello": "World"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}

#app.put("/item/{item_id}")
def uodate_item(item_id: int, item: Item):
    return {"item_name": item.name, "item_id":item_id)
