""" This Module for database connection and initialize table.

"""

from sqlalchemy import create_engine 
from sqlalchemy import Column, String, Integer, Float, Date, Boolean
from sqlalchemy.orm import relationship, declarative_base
from geoalchemy2 import Geometry
from dotenv import dotenv_values
import psycopg2

params = dotenv_values(".env")

# database credential
USERNAME = params.get("PG_USERNAME")
PASSWORD =params.get("PG_PASSWORD")
HOST = params.get("PG_HOST")
PORT = params.get("PG_PORT")
DATABASE = params.get("PG_DB")

# Create Engine
# Configuration Connection to Postgresql
SQLALCHEMY_DATABASE_URL = f"postgresql+psycopg2://{USERNAME}:{PASSWORD}@{HOST}:{PORT}/{DATABASE}"

engine = create_engine(SQLALCHEMY_DATABASE_URL)

# Manage Tables 
base = declarative_base()

class City(base):
    __tablename__ = "cities"
    city_id = Column(Integer, primary_key=True)
    city_name = Column(String)
    latitude = Column(Float)
    longitude = Column(Float)
    created_at = Column(Date)

    def __init__(self, city_id, city_name, latitude, longitude, created_at):
        self.city_id = city_id
        self.city_name = city_name
        self.latitude = latitude
        self.longitude = longitude
        self.created_at = created_at
        
class User(base):
    __tablename__ = "users"
    user_id = Column(Integer, primary_key=True)
    fullname = Column(String)
    phone_number = Column(String)
    city_id = Column(Integer)
    created_at = Column(Date)
    
    def __init__(self, user_id, fullname, phone_number, city_id, created_at):
        self.user_id = user_id
        self.fullname = fullname
        self.phone_number = phone_number
        self.city_id = city_id
        self.created_at = created_at

class Carproducts(base):
    __tablename__ = "car_products"
    product_id = Column(Integer, primary_key=True)
    model = Column(String)
    body_type = Column(String)
    price = Column(Integer)
    brand = Column(String)
    year = Column(String)
    created_at = Column(Date)
    
    def __init__(self, product_id, price, model, body_type, brand, year, created_at):
        self.product_id = product_id
        self.price = price
        self.model = model
        self.body_type = body_type
        self.brand = brand
        self.year = year
        self.created_at = created_at
        
        
        
class Advertisements(base):
    __tablename__ = "advertisements"
    advertisement_id = Column(Integer, primary_key=True)
    title = Column(String)
    detail_information = Column(String)
    bid_active = Column(Boolean)
    user_id = Column(Integer)
    product_id = Column(Integer)
    created_at = Column(Date)
    
    def __init__(self, advertisement_id, title, detail_information, bid_active, user_id, product_id, created_at):
        self.advertisement_id = advertisement_id
        self.title = title
        self.detail_information = detail_information
        self.bid_active = bid_active
        self.user_id = user_id
        self.product_id = product_id
        self.created_at = created_at

class Bid(base):
    __tablename__ = "bid"
    bid_id = Column(Integer, primary_key=True)
    bid_status = Column(String)
    bid_price = Column(Integer)
    user_id = Column(Integer)
    product_id = Column(Integer)
    created_at = Column(Date)
    
    def __init__(self, bid_id, bid_status, bid_price, user_id, product_id, created_at):
        self.bid_id = bid_id
        self.bid_status = bid_status
        self.bid_price = bid_price
        self.user_id = user_id
        self.product_id = product_id
        self.created_at = created_at