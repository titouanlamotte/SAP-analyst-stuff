from pyrfc import Connection
from pprint import pprint
import datetime
import time
import csv
#import numpy as np
import sys

# Sending a single CSV File as a an IMPORTEDTABLE to an ABAP SAP RFC
# /!\ Not suitable for a production env.
# /!\ Only for test purposes (cleartext password!)

conn = Connection(user='*********', passwd='*********', ashost='', sysnr='00', client='000')


with open('MyFile.csv', 'r',  encoding='utf-8-sig') as csvfile:  
    
    #sniff to find the format 
    #fileDialect = csv.Sniffer().sniff(csvfile.read(1024))
    #csvfile.seek(0)
    #pprint(fileDialect)
    #read the CSV file into a dictionary
	
    dictReader = csv.DictReader(csvfile, delimiter=';')
    pprint(dictReader.fieldnames)

    for row in dictReader:
        #do processing here, adapt each line according to your CSV file header
        imp = dict(
            POSKI=row["PSP Elem."],
            PBUKR=row["Buchungskreis"],
            PRCTR=row["Profit Center"]
        )

        IMPORTTABLE = [imp]
        
        result = conn.call("YOUR SAP REMOTE FUNCTION", I_IMPORTEDTABLE=IMPORTTABLE)
		
        pprint(result)
        time.sleep(0.2)