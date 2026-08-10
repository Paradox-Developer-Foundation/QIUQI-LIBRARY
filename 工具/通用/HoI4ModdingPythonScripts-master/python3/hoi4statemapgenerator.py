#!/usr/bin/python3
import argparse
import os
import sys
import re
from collections import defaultdict
import random
import pickle

try:
    from PIL import Image, ImageDraw, ImageFont
except:
    sys.exit("Requires pillow pip package to be installed. Run:\npip install pillow\nor\npip3.6 install pillow\ndepending on your installation and start the script again.\nMore info on installing packages: https://docs.python.org/3/installing/index.html")

try:
    import numpy as np
except:
    sys.exit("Requires numpy pip package to be installed. Run:\npip install numpy\nor\npip3.6 install numpy\ndepending on your installation and start the script again.\nMore info on installing packages: https://docs.python.org/3/installing/index.html")

#############################
###
### HoI 4 State IDs Map Generator by Yard1, originally for Equestria at War mod
### Written in Python 3.6
### Requires pillow and numpy pip packages to be installed. More info on installing packages: https://docs.python.org/3/installing/index.html
###
### Copyright (c) 2018 Antoni Baum (Yard1)
### Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
### The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
### THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
###
### usage: hoi4statemapgenerator.py [-h] [-c COLORS] [-nid]
###                                 provinces definition states output
### 
### Given valid provinces.bmp, definition.csv files and a folder of state history
### files (or strategic region files), generate an image containing a map of
### states with their IDs.
### 
### positional arguments:
###   provinces             Path to provinces.bmp file
###   definition            Path to definition.csv file
###   states                Path to 'history/states' or 'map/strategicregions'
###                         folder
###   output                Name of output file
### 
### optional arguments:
###   -h, --help            show this help message and exit
###   -c COLORS, --colors COLORS
###                         Name of pregenerated colors.pickle file (Default:
###                         hoi4statemapgenerator_colors.pickle)
###   -f FONT, --font FONT  Name of font to use (Default: ARIALN.TTF)
###   -nid, --no_ids        Do not put IDs on the map (Default: False)
###
#############################

BLUE_RBG = (68, 107, 163)

def readable_dir(prospective_dir):
  if not os.path.isdir(prospective_dir):
    raise Exception("readable_dir:{0} is not a valid path".format(prospective_dir))
  if os.access(prospective_dir, os.R_OK):
    return prospective_dir
  else:
    raise Exception("readable_dir:{0} is not a readable dir".format(prospective_dir))

#############################

# Copyright 2011 Álvaro Justen [alvarojusten at gmail dot com]
# License: GPL <http://www.gnu.org/copyleft/gpl.html>
# Begin copyright

def get_random_color(pastel_factor = 0.5):
    return [(x+pastel_factor)/(1.0+pastel_factor) for x in [random.uniform(0,1.0) for i in [1,2,3]]]

def color_distance(c1,c2):
    return sum([abs(x[0]-x[1]) for x in zip(c1,c2)])

def generate_new_color(existing_colors,pastel_factor = 0.5):
    max_distance = None
    best_color = None
    for _ in range(0,100):
        color = get_random_color(pastel_factor = pastel_factor)
        if not existing_colors:
            return color
        best_distance = min([color_distance(color,c) for c in existing_colors])
        if not max_distance or best_distance > max_distance:
            max_distance = best_distance
            best_color = color
    return best_color

# End copyright

#############################

def load_provinces(name):
    print("Reading file " + name + "...")
    im = Image.open(name)
    return im

def load_definition(name):
    print("Reading file " + name + "...")
    with open(name, "r") as f:
        lines = f.read().splitlines()
    provinces = {}
    for line in lines:
        line = line.split(";")
        provinces[int(line[0])] = (int(line[1]), int(line[2]), int(line[3]))
    return provinces

def load_state_file(name, states_dict):
    print("Reading file " + name + "...")
    with open(name, "r") as f:
        file_str = f.read()
    state_id = int(re.search(r"(?:id\s*=\s*)([0-9]+)", file_str).group(1))
    province_ids = [int(x) for x in re.search(r"(?:provinces\s*=\s*\{)((\s|.)*?)(?:\})", file_str).group(1).split()]
    states_dict[state_id] = province_ids

def create_states_map(colors_replacement_dict, provinces_image, water_color):
    water_color = (water_color[0], water_color[1], water_color[2])
    pixels = provinces_image.load()
    for i in range(provinces_image.size[0]):
        for j in range(provinces_image.size[1]):
            if pixels[i, j] in colors_replacement_dict:
                pixels[i, j] = colors_replacement_dict[pixels[i, j]][0]
            else:
                pixels[i, j] = water_color

def create_states_map_with_id(colors_replacement_dict, provinces_image, water_color, font_name):
    state_pixels = defaultdict(list)
    water_color = (water_color[0], water_color[1], water_color[2])
    pixels = provinces_image.load()
    for i in range(provinces_image.size[0]):
        for j in range(provinces_image.size[1]):
            if pixels[i, j] in colors_replacement_dict:
                res = colors_replacement_dict[pixels[i, j]]
                pixels[i, j] = res[0]
                state_pixels[res[1]].append((i, j))
            else:
                pixels[i, j] = water_color
    
    # thanks to Martin Stancsics, https://stackoverflow.com/questions/37519238/python-find-center-of-object-in-an-image
    m = None
    (X, Y) = provinces_image.size
    draw = ImageDraw.Draw(provinces_image)
    try:
        font = ImageFont.truetype(font_name, 10)
    except:
        print("Font " + font_name + "not found, using system default. This probably won't look good.")
        font = ImageFont.load_default()
    for state, pixels in state_pixels.items():
        m = np.zeros((X, Y))
        for pixel in pixels:
            m[pixel] = 1
        m = m / np.sum(np.sum(m))

        dx = np.sum(m, 1)
        dy = np.sum(m, 0)

        cx = np.sum(dx * np.arange(X))
        cy = np.sum(dy * np.arange(Y))

        w, h = font.getsize(str(state))
        draw.text((cx-w/2,cy-h/2), str(state), fill="black", font=font)

def get_colors(name):
    try:
        print("Reading file " + name + "...")
        with open(name, "rb") as handle:
            colors = pickle.load(handle)
    except:
        print("No file " + name + "found, creating new colors...")
        colors = [[(1/255)*BLUE_RBG[0], (1/255)*BLUE_RBG[1], (1/255)*BLUE_RBG[2]]]
    if len(states_dict) > len(colors)-1:
        for _ in range(len(states_dict)-((len(colors)-1))):
            colors.append(generate_new_color(colors))
        try:
            colors.remove([[(1/255)*BLUE_RBG[0], (1/255)*BLUE_RBG[1], (1/255)*BLUE_RBG[2]]])
        except:
            pass
        print("Saving file " + name + "...")
        try:
            with open(name, "wb") as handle:
                pickle.dump(colors, handle, protocol=pickle.HIGHEST_PROTOCOL)
        except:
            print("Could not save file " + name + "! Continuing...")

    colors.insert(0, [(1/255)*BLUE_RBG[0], (1/255)*BLUE_RBG[1], (1/255)*BLUE_RBG[2]])
    return colors

#############################

parser = argparse.ArgumentParser(description='Given valid provinces.bmp, definition.csv files and a folder of state history files (or strategic region files), generate an image containing a map of states with their IDs.')
parser.add_argument('provinces',
                    help='Path to provinces.bmp file')
parser.add_argument( 'definition',
                    help='Path to definition.csv file')
parser.add_argument( 'states',
                    help='Path to \'history/states\' or \'map/strategicregions\' folder')
parser.add_argument( 'output',
                    help='Name of output file')
parser.add_argument('-c', '--colors', required=False, default="hoi4statemapgenerator_colors.pickle",
                    help='Name of pregenerated colors.pickle file (Default: hoi4statemapgenerator_colors.pickle)')
parser.add_argument('-f', '--font', required=False, default="ARIALN.TTF",
                    help='Name of font to use (Default: ARIALN.TTF)')
parser.add_argument( '-nid', '--no_ids', action='store_true', required=False, default=False,
                    help='Do not put IDs on the map (Default: False)')

args = parser.parse_args()

try:
    dir = readable_dir(args.states)
except:
    sys.exit("states is not a vaild folder.")

states_path = args.states
states_dict = {}
for file in os.listdir(states_path):
    if file.endswith(".txt"):
        load_state_file(os.path.join(states_path, file), states_dict)

colors = get_colors(args.colors)

provinces = load_definition(args.definition)

province_map = load_provinces(args.provinces)

colors_replacement_dict = {}

for state_id, state_provinces in states_dict.items():
    color = [round(255 * x) for x in colors.pop()]

    #print("STATE %s: COLOR: %s" % (str(state_id), color))
    for province in state_provinces:
        colors_replacement_dict[provinces[province]] = ((color[0], color[1], color[2]), state_id)

print("Generating map image - this may take a while...")
if args.no_ids:
    create_states_map(colors_replacement_dict, province_map, [round(255 * x) for x in colors[0]])
else:
    create_states_map_with_id(colors_replacement_dict, province_map, [round(255 * x) for x in colors[0]], args.font)

province_map.show()
print("Saving file " + args.output + "...")
province_map.save(args.output, "PNG")
