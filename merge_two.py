# merge_two.py

import json

def merge_two(first_dict):
    # Create a copy so we don't modify the original
    merged = dict(first_dict)

    while True:
        print("Add a new entry:")
        key = input("key: ")

        if key == "exit":
            break

        value = input("value: ")
        value = int(value)  # convert to integer always

        merged[key] = value  # overwrite if key exists

    # Return JSON string
    return json.dumps(merged)
