""" This Module for seeding dummy data car_product.csv

"""

#import library
import csv 
import database as db
from sqlalchemy.orm import sessionmaker

# New Session 
Session = sessionmaker(bind=db.engine)
session = Session()

# open file car_product.csv
# open with mode 'r'(read)
with open(file = 'car_product.csv', mode = 'r') as csvfile:
    #create object
    csv_dict_reader = csv.DictReader(csvfile)
    
    #loop every row
    for row in csv_dict_reader:
        print(row)
