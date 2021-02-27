from typing import Optional
import sqlalchemy

from fastapi import FastAPI
from pydantic import BaseModel
from sqlalchemy import text

app = FastAPI()

engine = sqlalchemy.create_engine(
    'postgres://root:root@localhost:5432/food_for_thought'
)

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


class Coordinates(BaseModel):
    latitude: float
    longitude: float

class SearchRequest(BaseModel):
    s: str
    ne: Coordinates
    sw: Coordinates

@app.post("/restaurants/search")
async def restaurants_search(sr: SearchRequest):
    return [
        {
            "label": "Chevermeto",
            "address": "ul. Bogatica 22",
            "coordinates":  {
                "lat": 42.7011,
                "lon": 23.3144,
            }
        }
    ]
