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

# open file advertisement.csv
# open with mode 'r'(read)
with open(file = 'dummy_csv/advertisement.csv', mode = 'r') as csvfile:
    #create object
    csv_dict_reader = csv.DictReader(csvfile)
    
    #loop every row
    for row in csv_dict_reader:
        ad = db.Advertisements(
            row['advertisement_id'],
            row['title'],
            row['detail_information'],
            bool(row['bid_active']),
            row['user_id'],
            row['product_id'],
            date.today()
        )
        session.add(ad)
    session.commit()
    session.close()
        
