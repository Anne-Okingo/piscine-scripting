#!/usr/bin/env python3

import sys

def main():
    # Check number of arguments
    if len(sys.argv) != 2:
        print("Error: wrong number of arguments")
        sys.exit(1)

    # Convert argument to int (guaranteed valid)
    num_candidates = int(sys.argv[1])

    candidates = {}  # dictionary: name → age

    for _ in range(num_candidates):
        print("Add a new candidate:")
        name = input("name: ")
        age = int(input("age: "))
        candidates[name] = age

    # Check eligibility
    for name, age in candidates.items():
        if age < 18:
            print(f"{name} is not eligible (underaged)")
        elif age > 60:
            print(f"{name} is not eligible (over the legal age)")
        else:
            print(f"{name} is eligible")


if __name__ == '__main__':
    main()
