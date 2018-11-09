#!/usr/bin/env #!

# exported from COACH - https://github.com/alittlebrighter/coach

#-ALIAS- = util.findAndReplace
# -TAGS- = util.findAndReplace
#-SHELL- = #!
#
#-DOCUMENTATION- !DO NOT EDIT THIS LINE!
# Finds and replaces the specified strings in every file found within the specified directory.
#
#-SCRIPT- !DO NOT EDIT THIS LINE!
#
# Finds and replaces the specified strings in every file found within the specified directory.
#
import os
import re
import sys


DIRECTORY = input("File/Directory: ")
OLD_STRING = input("Old: ")
NEW_STRING = input("New: ")

replacements = [
    (re.compile(OLD_STRING), NEW_STRING)
]


def walkDirectory(dir):
    for subdir, dirs, files in os.walk(dir):
        for file in files:
            processFile(os.path.join(subdir, file))


def processFile(file):
    contents = ""

    with open(file, "r", encoding = "ISO-8859-1") as fin:
        contents = fin.read()

    for r in replacements:
        contents = r[0].sub(r[1], contents)

    try:
        with open(file, "w") as fout:
            fout.write(contents)
    except:
        print("could not write to file: " + file)


def addInPlace(target, regex, supplement):
    matches = regex.findall(target)

    if matches:
        target = target.replace(matches[0], matches[0] + supplement)

    return target


if __name__ == "__main__":
    try:
        processFile(DIRECTORY)
    except:
        walkDirectory(DIRECTORY)
