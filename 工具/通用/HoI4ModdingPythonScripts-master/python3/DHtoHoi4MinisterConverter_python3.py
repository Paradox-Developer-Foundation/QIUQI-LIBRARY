#!/usr/bin/python3
import argparse
import sys
import re
import codecs
import string
import collections
try:
    from unidecode import unidecode
except:
    sys.exit("Requires unidecode pip package to be installed. Run:\npip install unidecode\nor\npip3 install unidecode\ndepending on your installation and start the script again.\nMore info on installing packages: https://docs.python.org/3/installing/index.html")

#############################
###
### HoI Darkest Hour minister to HoI4 idea converter by Yard1, originally for Darkest Hour mod
### Requires pyton3-pip to be installed
### Requires unidecode pip package to be installed (pip install unidecode / pip3 install unidecode). More info on installing packages: https://docs.python.org/3/installing/index.html
### Written in Python 3.6
###
### Copyright (c) 2017 Antoni Baum (Yard1)
### Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
### The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
### THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
###
### usage: DHtoHoi4MinisterConverter_python3.py [-h] [-l LOCALISATION]
###                                            input output
###
### Given a HoI Darkest Hour .csv Minister file, create a HoI 4 ideas file with a
### given name with those ministers converted. Default format is for Darkest Hour
### mod by Algierian General. A localisation file with the names of ministers can
### also be created.
### 
### positional arguments:
###   input                 Darkest Hour .csv minister file
###   output                Name of HoI4 ideas file to write (overwrites)
### 
### optional arguments:
###   -h, --help            show this help message and exit
###   -l LOCALISATION, --localisation LOCALISATION
###                         Localisation file to write (overwrites)
###
#############################
if not sys.version_info >= (3,0):
    sys.exit("Wrong Python version. Version 3.0 or higher is required to run this script!")
blocked_positions = ["Head of State"]
positions = collections.OrderedDict([("Head_of_Government", "HoG"), ("Foreign_Minister", "FM"), ("Minister_of_Security", "MoS"), ("Armaments_Minister", "AM"), ("Head_of_Intelligence", "HoI"), ("Chief_of_Staff", "CoStaff"), ("Chief_of_Army", "CoArmy"), ("Chief_of_Navy", "CoNavy"), ("Chief_of_Airforce", "CoAir")])
ideologies = ["NS", "FA", "PA", "SC", "ML", "SL", "SD", "LWR", "LE", "ST"]
position_translation = dict([("Minister of Armament", "Armaments Minister"), ("Head of Military Intelligence", "Head of Intelligence"), ("Chief of Air Force", "Chief of Airforce")])

class minister:    
    def __init__(self, position, name, start_year, end_year, ideology, trait, country_tag):
        if position in position_translation:
            position = position_translation[position]
        self.position = re.sub(" ", "_", position)
        self.name = name
        self.start_year = start_year
        self.end_year = end_year
        self.ideology = ideology
        self.trait = string.capwords(trait)
        self.parsed_name = re.sub(" ", "_", re.sub('[^A-Za-z0-9 ]+', '', unidecode(self.name)))
        self.idea_tag = "%s_%s_%s" % (country_tag, positions[self.position], self.parsed_name)
    
    def __repr__(self):
        return "<minister position:%s name:%s start_year:%s end_year:%s ideology:%s trait:%s>" % (self.position, self.name, self.start_year, self.end_year, self.ideology, self.trait)

    def __str__(self):
        return "%s, %s, %s, %s, %s, %s" % (self.position, self.name, self.start_year, self.end_year, self.ideology, self.trait)
    
    def convert(self, country_tag):
        return str("\t# %s\n\t\t%s = {\n\t\t\tpicture = Generic_Portrait\n\t\t\tallowed = { tag = %s }\n\t\t\tavailable = {\n\t\t\t\tdate > %s\n\t\t\t\tdate < %s\n\t\t\t\t%s = yes\n\t\t\t\tNOT = { has_country_flag = %s }\n\t\t\t}\n\t\t\tcost = 150\n\t\t\tremoval_cost = 10\n\t\t\ttraits = { %s %s }\n\t\t}" % (self.name, self.idea_tag, country_tag, "%s.1.1" % self.start_year, "%s.1.1" % self.end_year, "%s_Minister_Allowed" % self.ideology, "%s_unavailable" % self.parsed_name, positions[self.position]+"_"+re.sub(" ", "_", self.trait), "ideology_"+self.ideology))
        
def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        pass
 
    try:
        import unicodedata
        unicodedata.numeric(s)
        return True
    except (TypeError, ValueError):
        pass
 
    return False

def readDHfile(name):
    print(("Reading file " + name + "..."))
    with codecs.open(name, encoding='ISO-8859-15', mode="r") as f:
        lines = f.read().splitlines()
    ministers = list()
    tag = lines[0].split(';')[0]
    for line in lines:
        split_line = line.split(';')
        if not is_number(split_line[0]):
            continue 
        if split_line[1] not in blocked_positions:
            ministers.append(minister(split_line[1], split_line[2], split_line[3], split_line[4], split_line[6], split_line[7], tag))
    return (sorted(ministers, key=lambda minister: (list(positions.keys()).index(minister.position), ideologies.index(minister.ideology), minister.start_year)), tag) 

def createHOI4ideasfile(name, ministers, country_tag):
    lines = list()
    lines.append("ideas = {")
    current_position = ""
    append_brace = False
    for minister in ministers:      
        if current_position != minister.position:
            if append_brace:
                lines.append("}")
            lines.append("#################################################")
            lines.append("### %s" % (re.sub("_", " ", minister.position)))
            lines.append("#################################################")
            lines.append("\t%s = {" % minister.position)
            append_brace = True
        current_position = minister.position
        lines.extend(minister.convert(country_tag).splitlines()) 
        append_brace = True   
    lines.append("\t}")
    lines.append("}")
    with codecs.open(name, encoding='utf-8-sig', mode="w") as f:
        f.writelines(line + "\n" for line in lines)

def createHOI4localisationfile(name, ministers):
    lines = ["l_english:"]
    for minister in ministers:
        lines.append(" %s:0 \"%s\"" % (minister.idea_tag, minister.name))
    with codecs.open(name, encoding='utf-8-sig', mode="w") as f:
        f.writelines(line + "\n" for line in lines)
###################################################################

parser = argparse.ArgumentParser(description='Given a HoI Darkest Hour .csv Minister file, create a HoI 4 ideas file with a given name with those ministers converted. Default format is for Darkest Hour mod by Algierian General. A localisation file with the names of ministers can also be created.')
parser.add_argument('input',
                    help='Darkest Hour .csv minister file')
parser.add_argument( 'output',
                    help='Name of HoI4 ideas file to write (overwrites)')
parser.add_argument('-l', '--localisation', required=False, default="",
                    help='Localisation file to write (overwrites - make sure the file name has "l_english" in it!)')

args = parser.parse_args()
parsed_file = readDHfile(args.input)
country_tag = parsed_file[1]
ministers = parsed_file[0]
print(("File %s read successfully, %s ministers found" % (args.input, len(ministers))))
createHOI4ideasfile(args.output, ministers, country_tag)
print(("Ideas file %s created successfully" % args.output))
if args.localisation:
    createHOI4localisationfile(args.localisation, ministers)
    print(("Localisation file %s created successfully" % args.localisation))
