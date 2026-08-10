#!/usr/bin/python
import argparse
import os
import glob
import sys

#############################
###
### HoI 4 State Manpower Multiplier by Yard1, originally for Equestria at War mod
### Written in Python 2.7
###
### Copyright (c) 2017 Antoni Baum (Yard1)
### Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
### The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
### THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
###
### usage: hoi4StateManpowerChanger.py [-h] input multiplier
###
### Given a state history file or folder, multiply the manpower by a given
### multiplier.
###
### positional arguments:
###   input       State history file name/folder containing files
###   multiplier  Manpower multiplier
###
### optional arguments:
###   -h, --help  show this help message and exit
###
#############################

def readable_dir(prospective_dir):
  if not os.path.isdir(prospective_dir):
    raise Exception("readable_dir:{0} is not a valid path".format(prospective_dir))
  if os.access(prospective_dir, os.R_OK):
    return prospective_dir
  else:
    raise Exception("readable_dir:{0} is not a readable dir".format(prospective_dir))

#############################

def increase_manpower(name, multi):
    print("Reading file " + name + "...")
    with open(name, "r") as f:
        lines = f.read().splitlines()
    new_lines = list()
    for line in lines:
        if "manpower" in line:
            nline = line.split("=")
            nline[1] = str(int(int(nline[1])*float(multi)))
            line = nline[0] + "=" + nline[1]
        new_lines.append(line)
    with open(name, "w") as f:
        f.writelines(str(line) + "\n" for line in new_lines)

#############################
parser = argparse.ArgumentParser(description='Given a state history file or folder, multiply the manpower by a given multiplier.')
parser.add_argument('input', metavar='input',
                    help='State history file name/folder containing files')
parser.add_argument('multiplier', metavar='multiplier',
                    help='Manpower multiplier')

args = parser.parse_args()
counter = 0
names_global = list()
is_dir = False
try:
    dir = readable_dir(args.input)
    is_dir = True
except:
    print("Not a directory, treating as file.")

if is_dir:
    for f in glob.glob(dir+"/*"):
        try:
            increase_manpower(f, args.multiplier)
            counter = counter+1
        except:
            pass
else:
    increase_manpower(args.input, args.multiplier)
    counter = counter+1
print("Finished, %s state files parsed" % counter)
