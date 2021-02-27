import csv
import psycopg2

restaurants = []

# Read the dataset csv

with open('20210226221543076_unique.csv') as csv_file:
    reader = csv.reader(csv_file)
    for row in reader:
        # Every row is a list
        restaurants.append(row)


# Connect to DB
conn = psycopg2.connect(database="food_for_thought", user='root', password='root', host='127.0.0.1', port='5432')
conn.autocommit = True

cursor = conn.cursor()

for item in restaurants[1:]:
    # Skip if latitude or longtitude is missing
    if not item[2] or not item[3]:
        continue
    # Replace because of the apostrophes
    item[0] = item[0].replace("'","''")
    cursor.execute(f'''INSERT INTO restaurants(id, address, coordinates, name)
                      VALUES (uuid_generate_v4(), '{item[1]}',
                      ST_SetSRID(ST_MakePoint(cast({item[3]} as double precision),
                                            cast({item[2]} as double precision))::geography,4326)::geometry, E'{item[0]}')''')

conn.commit()
conn.close()
