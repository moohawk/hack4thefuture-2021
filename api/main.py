from typing import Optional

from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Restaurant(BaseModel):
    name: str
    address: str
    latitude: float
    longitude: float


@app.get("/")
async def read_root():
    return "Wellcome to Food For Thought" 

@app.get("/restaurants/")
async def get_all_restaurants():
    return [{"Restaurant":1},{"Restaurant":2}]

@app.get("/restaurants/{restaurant_id}")                               
async def get_restaurant_by_id(restaurant_id: int):
    return {"restaurant_id": restaurant_id, "Restaurant": restaurant_id}

@app.get("/search")                               
async def get_restaurants_by_location(latitude: float, longitude: float):
    return [{"Restaurant":latitude},{"Restaurant":longitude}]
