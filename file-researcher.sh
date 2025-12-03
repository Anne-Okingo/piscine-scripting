#!/bin/bash

#Find the sentence that starts with  "It takes 12 honey"
grep "^It takes 12 honey" file-researcher/facts.txt


#Print all lines containing "year" with line numbers
grep -n "year" file-researcher/facts.txt
