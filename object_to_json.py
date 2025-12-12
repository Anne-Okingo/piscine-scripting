# object_to_json.py

import json

class User:
    username = "user"
    email = "something@mail.com"


def create_new_user(json_string):
    # Convert JSON string to dict
    try:
        data = json.loads(json_string)
    except:
        # If json is invalid, return default user
        return User()

    # Validate required keys
    if "username" in data and "email" in data:
        user = User()
        user.username = data["username"]
        user.email = data["email"]
        return user

    # Otherwise return default user
    return User()


def user_to_json(user):
    # Convert the object to a dict of only its instance attributes
    user_dict = user.__dict__

    # If empty dict, return "{}"
    return json.dumps(user_dict)
