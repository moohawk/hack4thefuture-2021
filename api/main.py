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

@app.get("/restaurants/search")
async def get_restaurants_by_location(latitude: float = 0.0, longitude: float = 0.0):
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
