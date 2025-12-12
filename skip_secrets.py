import sys
import os

def main():
    # Check number of arguments
    if len(sys.argv) != 2:
        exit(1)

    filename = sys.argv[1]

    # Check if file exists and is readable
    if not os.path.isfile(filename) or not os.access(filename, os.R_OK):
        exit(1)

    try:
        with open(filename, "r") as infile, open("out.txt", "w") as outfile:
            for line in infile:
                # Skip lines containing "pineapple"
                if "pineapple" not in line:
                    outfile.write(line)
    except Exception:
        # Any unexpected error → exit 1
        exit(1)


if __name__ == "__main__":
    main()
