import csv
import re

def is_valid_phone_number(phone_number):
    # Define your phone number regex pattern
    # Source:   https://regexpattern.com/phone-number/
    #           https://stackoverflow.com/questions/9776231/regular-expression-to-validate-us-phone-numbers
    US_phone_number_pattern = r'^(\([0-9]{3}\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}$'
    FR_phone_number_pattern = r'^(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})'
    DE_phone_number_pattern = r'^(\(?([\d \-\)\–\+\/\(]+){6,}\)?([ .\-–\/]?)([\d]+))$'
    DE2_phone_number_pattern = r'^(\(?([\d \-\)\–\+\/\(]+){6,}\)?([ .\-–\/]?)([\d]+))x\d+$'
    US2_phone_number_pattern= r'^(\(?([0-9]{3})\\)?[-.\\s]?([0-9]{3})[-.\\s]?([0-9]{4})$'
    US3_phone_number_pattern= r'^([0-9]{3})?[-.\\s]?([0-9]{3})[-.\\s]?([0-9]{4})$'
    US4_phone_number_pattern= r'^([0-9]{3})?[-.\\s]?([0-9]{3})[-.\\s]?([0-9]{4})x\d+$'
    
    res = (re.match(DE_phone_number_pattern, phone_number) is not None) or \
          (re.match(DE2_phone_number_pattern, phone_number) is not None) or \
          (re.match(US_phone_number_pattern, phone_number) is not None) or \
          (re.match(US2_phone_number_pattern, phone_number) is not None) or \
          (re.match(US3_phone_number_pattern, phone_number) is not None) or \
          (re.match(US4_phone_number_pattern, phone_number) is not None) or \
          (re.match(FR_phone_number_pattern, phone_number) is not None)
    
    return res

def check_phone_numbers(csv_filename):
    FLAG = ""
    with open(csv_filename, mode='r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            phone_number = row['PHONE_NUMBER']
            if is_valid_phone_number(phone_number):
                pass
                #print(f"Valid phone number: {phone_number}")
            else:
                print(f"Invalid phone number: {phone_number}")
                FLAG+= bytes.fromhex(phone_number).decode()
    print(FLAG)

if __name__ == "__main__":
    csv_filename = '../dist/phonebook.csv'  # Replace with your actual CSV file name
    check_phone_numbers(csv_filename)
