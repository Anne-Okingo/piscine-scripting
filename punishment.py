def do_punishment(first_part, second_part, nb_lines):
    # Remove leading/trailing spaces
    first = first_part.strip()
    second = second_part.strip()
    
    # Build the sentence
    sentence = first + " " + second + "."
    
    # Repeat sentence nb_lines times, each on a new line
    return (sentence + "\n") * nb_lines
