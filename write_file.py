def to_do(input_list):
    with open("output.txt", "w") as file:
        for date_obj, task in input_list:
            formatted_date = date_obj.strftime("%A %d %B %Y")
            file.write(f"{formatted_date}: {task}\n")
