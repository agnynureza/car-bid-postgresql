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
with open(file = 'dummy_csv/users.csv', mode = 'r') as csvfile:
    #create object
    csv_dict_reader = csv.DictReader(csvfile)
    
    #loop every row
    for row in csv_dict_reader:
        user = db.User(
            row['user_id'],
            row['name'],
            row['phone_number'],
            row['city_id'],
            date.today()
        )
        session.add(user)
    session.commit()
    session.close()
        