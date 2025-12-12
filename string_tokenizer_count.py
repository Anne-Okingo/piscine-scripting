import re
from collections import Counter

def tokenizer_counter(text):
    # Lowercase
    text = text.lower()

    # Remove punctuation (keep letters and numbers only)
    text = re.sub(r"[^a-z0-9\s]", "", text)

    # Split into words
    words = text.split()

    # Count words
    counts = Counter(words)

    # Return sorted dictionary (sorted by the word)
    return dict(sorted(counts.items()))
