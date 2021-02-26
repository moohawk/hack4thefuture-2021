# Start

Server starts with `uvicorn main:app --reload`
--reload option is to reload on every code change

# Endpoints
"/" 
"/restaurants"
"/restaurants/{restaurant_id}"
"/search"

The search is called with parameters for latitude and longitude:
http://127.0.0.1:8000/search?latitude=12&longitude=12

#Results
Dummy hardcoded results
