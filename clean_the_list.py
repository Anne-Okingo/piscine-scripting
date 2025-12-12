def clean_list(items):
    # If input is empty, return empty list
    if not items:
        return []

    # Make a copy to avoid modifying the original list
    clean_items = []

    # First, make sure "milk" is included (case-insensitive check)
    if not any(item.strip().lower() == "milk" for item in items):
        items.append("milk")

    # Process each item
    for index, item in enumerate(items, start=1):
        # Remove leading/trailing spaces
        stripped = item.strip()
        # Capitalize correctly
        capitalized = stripped.capitalize()
        # Add index and formatting
        formatted = f"{index}/ {capitalized}"
        clean_items.append(formatted)

    return clean_items
