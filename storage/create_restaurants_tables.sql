CREATE EXTENSION IF NOT EXISTS "uuid-ossp";                                                                                                                                                                        
CREATE EXTENSION IF NOT EXISTS postgis;                                                                                                                                                                            
CREATE EXTENSION IF NOT EXISTS postgis_topology;

create table restaurants(
	id uuid not null primary key,
	address text not null,
	coordinates geometry(Point,4326),
	name text not null
);

