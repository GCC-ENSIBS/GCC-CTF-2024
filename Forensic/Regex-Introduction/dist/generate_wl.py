import csv
from faker import Faker

def generate_fake_data(num_records):
    fake = Faker(['en_US', 'ja_JP', 'fr_FR'])
    data = []

    for _ in range(num_records):
        record = {
            'ID': fake.uuid4(),
            'FIRST_NAME': fake.first_name(),
            'LAST_NAME': fake.last_name(),
            'MAIL': fake.email(),
            'PHONE_NUMBER': fake.phone_number(),
            'ADDRESS': fake.address()
        }
        data.append(record)

    return data

def write_to_csv(data, filename='fake_data.csv'):
    fieldnames = ['ID', 'FIRST_NAME', 'LAST_NAME', 'MAIL', 'PHONE_NUMBER', 'ADDRESS']

    with open(filename, mode='w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(data)

if __name__ == "__main__":
    num_records = 10000  # You can change this to the desired number of records
    fake_data = generate_fake_data(num_records)
    write_to_csv(fake_data)
    print(f'Generated {num_records} fake records. Check fake_data.csv')
