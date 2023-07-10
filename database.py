""" This Module for database connection and initialize table.

"""

from sqlalchemy import create_engine 
from sqlalchemy import Column, String, Integer, ForeignKey, Date
from sqlalchemy.orm import relationship, declarative_base
from dotenv import dotenv_values

params = dotenv_values(".env")

# database credential
USERNAME = params.get("PG_USERNAME")
PASSWORD =params.get("PG_PASSWORD")
HOST = params.get("PG_HOST")
PORT = params.get("PG_PORT")
DATABASE = params.get("PG_DB")

# Create Engine
# Configuration Connection to Postgresql
SQLALCHEMY_DATABASE_URL = f"mysql+mysqlconnector://{USERNAME}:{PASSWORD}@{HOST}:{PORT}/{DATABASE}"

engine = create_engine(SQLALCHEMY_DATABASE_URL, echo=True)

# Manage Tables 
base = declarative_base()

class Customer(base):
    """Customer

    Args:
        base (_type_): _description_
    """
    __tablename__ = "sc_customer"
    id = Column(Integer, primary_key=True)
    name = Column(String)
    
    def __init__(self, name):
        self.name = name
        
class Transaction(base):
    """Transaction

    Args:
        base (_type_): _description_
    """
    
    __tablename__ = "sc_transaction"
    id = Column(Integer, primary_key=True)
    item_name = Column(String)
    item_amount = Column(Integer)
    price = Column(Integer)
    total_price = Column(Integer)
    discount = Column(Integer)
    price_after_discount = Column(Integer)
    created_at = Column(Date)
    customers = relationship(Customer, secondary = 'sc_item_transaction')
    
    def __init__(self, item_name, item_amount, price, total_price, discount, price_after_discount, created_at):
        self.item_name = item_name
        self.item_amount = item_amount
        self.price = price
        self.total_price = total_price
        self.discount = discount
        self.price_after_discount = price_after_discount
        self.created_at = created_at

class Item_Transaction(base):
    """Item_Transaction

    Args:
        base (_type_): _description_
    """
    __tablename__ = 'sc_item_transaction'
    customer_id = Column(Integer, ForeignKey('sc_customer.id'), primary_key = True)
    transaction_id = Column(Integer, ForeignKey('sc_transaction.id'), primary_key = True)
    
    
    
base.metadata.create_all(engine)