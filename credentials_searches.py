import json
import os

def credentials_search():
    logs_file = "logs.json"
    output_file = "credentials.json"

    # If output file already exists from before, remove it
    if os.path.exists(output_file):
        os.remove(output_file)

    # Check if logs.json exists
    if not os.path.exists(logs_file):
        return

    # Try to load logs.json and validate JSON structure
    try:
        with open(logs_file, "r") as f:
            data = f.read().strip()
            if not data:
                return  # Empty file = no output

            data = json.loads(data)  # May raise JSONDecodeError
    except Exception:
        return  # Invalid JSON = no output

    # Recursively search for keys password & secret
    found = {}

    def search(obj):
        if isinstance(obj, dict):
            for key, value in obj.items():
                if key == "password":
                    found["password"] = value
                elif key == "secret":
                    found["secret"] = value

                # Continue searching nested structures
                if isinstance(value, (dict, list)):
                    search(value)

        elif isinstance(obj, list):
            for element in obj:
                search(element)

    search(data)

    # Create credentials.json only if at least one key is found
    if found:
        with open(output_file, "w") as f:
            json.dump(found, f, indent=2)
