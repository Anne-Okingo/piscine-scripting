# string_processing.py

import re

def tokenize(sentence):
    # Lowercase the sentence
    sentence = sentence.lower()

    # Remove all punctuation and special characters:
    # Replace anything NOT a-z, A-Z, or 0-9 with a space
    sentence = re.sub(r"[^a-z0-9]+", " ", sentence)

    # Split into list of words
    words = sentence.split()

    return words
