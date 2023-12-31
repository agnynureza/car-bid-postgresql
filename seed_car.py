""" This Module for seeding dummy data car_product.csv

"""

#import library
import csv 
import database as db
from sqlalchemy.orm import sessionmaker
from datetime import date

# New Session 
Session = sessionmaker(bind=db.engine)
session = Session()

# open file car_product.csv
# open with mode 'r'(read)
with open(file = 'dummy_csv/car_product.csv', mode = 'r') as csvfile:
    #create object
    csv_dict_reader = csv.DictReader(csvfile)
    
    #loop every row
    for row in csv_dict_reader:
        car = db.Carproducts(
            row['product_id'],
            row['price'],
            row['model'],
            row['body_type'],
            row['brand'],
            row['year'],
            date.today()
        )
        session.add(car)
    session.commit()
    session.close()
        
