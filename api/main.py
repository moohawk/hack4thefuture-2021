from datetime import datetime

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

class RestaurantSearchRequest(BaseModel):
    s: Optional[str] = None
    ne: Optional[Coordinates] = None
    sw: Optional[Coordinates] = None
    limit: Optional[int] = 30

@app.post("/restaurants/search")
async def restaurants_search(sr: RestaurantSearchRequest):
    sql = text("""SELECT id, name,  ST_Y(coordinates) as lat, ST_X(coordinates) as lon, address FROM public.restaurants
    WHERE ST_Contains(st_makeenvelope(:min_x, :min_y, :max_x, :max_y, 4326), coordinates) AND name != '' LIMIT :limit """)
    rs = engine.execute(sql, {"min_x": sr.sw.longitude, "min_y": sr.sw.latitude, "max_x": sr.ne.longitude, "max_y": sr.ne.latitude, "limit": sr.limit})
    search_results = []
    for r in rs:
        search_results.append(dict(r))
    return search_results


class ContributionSearchRequest(BaseModel):
    s: Optional[str] = None
    coordinates: Optional[Coordinates] = None

class ValidTime(BaseModel):
    valid_from: datetime
    valid_to: datetime

class Contribution(BaseModel):
    title: str
    status: str
    retstaurant: Restaurant
    valid_time: ValidTime

@app.post("/contributions/search")
async def contributions_search(sr: ContributionSearchRequest):
    sql = text("""SELECT c.id as contribution_id, title, lower(valid_time) as valid_from, upper(valid_time) as valid_to, c.status, 
                name, coordinates, address FROM public.contributions as c
                LEFT JOIN public.restaurants on restaurants.id = c.restaurant_id
                ORDER BY ST_Distance(ST_MakePoint(cast(:lat as double precision),
                                            cast(:lon as double precision))::geography, coordinates)""")
    rs = engine.execute(sql, {"lat": sr.coordinates.latitude, "lon": sr.coordinates.longitude})
    search_results = []
    for r in rs:
        search_results.append(dict(r))
    return search_results
