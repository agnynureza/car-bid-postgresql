""" This Module for seeding dummy data city.csv

"""

#import library
import csv 
import csv 
import database as db
from sqlalchemy.orm import sessionmaker

# New Session 
Session = sessionmaker(bind=db.engine)
session = Session()


# open file city.csv
# open with mode 'r'(read)
with open(file = 'city.csv', mode = 'r') as csvfile:
    #create object
    csv_dict_reader = csv.DictReader(csvfile)
    
    #loop every row
    for row in csv_dict_reader:
        print(row)
