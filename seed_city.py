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
with open(file = 'dummy_csv/city.csv', mode = 'r') as csvfile:
    #create object
    csv_dict_reader = csv.DictReader(csvfile)
    
    #loop every row
    for row in csv_dict_reader:
        city = db.City(
            row['kota_id'],
            row['nama_kota'],
            row['latitude'],
            row['longitude'],
            date.today()
        )
        session.add(city)
    session.commit()
    session.close()
        