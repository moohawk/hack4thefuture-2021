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
    s: Optional[str] = None
    ne: Optional[Coordinates] = None
    sw: Optional[Coordinates] = None
    limit: Optional[int] = 30

@app.post("/restaurants/search")
async def restaurants_search(sr: SearchRequest):
    sql = text("""SELECT id, name,  ST_Y(coordinates) as lat, ST_X(coordinates) as lon, address FROM public.restaurants
    WHERE ST_Contains(st_makeenvelope(:min_x, :min_y, :max_x, :max_y, 4326), coordinates) AND name != '' LIMIT :limit """)
    rs = engine.execute(sql, {"min_x": sr.sw.longitude, "min_y": sr.sw.latitude, "max_x": sr.ne.longitude, "max_y": sr.ne.latitude, "limit": sr.limit})
    search_results = []
    for r in rs:
        search_results.append(dict(r))
    return search_results
