""" This Module for seeding dummy data city.csv

"""

#import library
import csv 
import csv 
import database as db
from sqlalchemy.orm import sessionmaker
from datetime import date

# New Session 
Session = sessionmaker(bind=db.engine)
session = Session()


# open file city.csv
# open with mode 'r'(read)
with open(file = 'dummy_csv/bid.csv', mode = 'r') as csvfile:
    #create object
    csv_dict_reader = csv.DictReader(csvfile)
    
    #loop every row
    for row in csv_dict_reader:
        bid = db.Bid(
            row['bid_id'],
            row['bid_status'],
            row['bid_price'],
            row['user_id'],
            row['product_id'],
            row['created_at']
        )
        session.add(bid)
    session.commit()
    session.close()
        