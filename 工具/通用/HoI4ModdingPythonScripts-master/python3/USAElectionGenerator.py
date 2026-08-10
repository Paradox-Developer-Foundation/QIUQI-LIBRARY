#!/usr/bin/python3
import argparse
import sys
import re
import codecs
import collections
import string
from itertools import islice
from operator import itemgetter
from enum import Enum 

#############################
###
### HoI 4 USA Election Generator by Yard1, originally for Fuhrerreich mod
### Example .csv file by jespertjee
### Written in Python 3.5.2
###
### Copyright (c) 2018 Antoni Baum (Yard1)
### Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
### The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
### THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
###
### usage: USAElectionGenerator.py [-h] [-r REGION_NAMES] [-s]
###                                [-loc SUMMARY_EVENT_LOCALIZATION]
###                                input namespace starting_event_id_index output
### 
### Given a properly formatted .csv file, create HoI 4 events simulating counting
### of votes USA elections (first past the post). Originally written for
### Fuhrerreich mod.
### 
### positional arguments:
###   input                 Fuhrerreich .csv USA elections file
###   namespace             Event ID namespace (Example: "usa.election.1936")
###   starting_event_id_index
###                         A free event ID index (Example: "2")
###   output                Name of HoI4 event file to write to (appends)
### 
### optional arguments:
###   -h, --help            show this help message and exit
###   -r REGION_NAMES, --region_names REGION_NAMES
###                         Optional region names separated by comma "," ordered
###                         as in the .csv file (Example: "West,North
###                         Central,Southeast,Northeast"). If not given, indexes
###                         will be used instead.
###   -s, --summary_event   Generate summary and winner determination events? (Default: False)
###   -loc SUMMARY_EVENT_LOCALIZATION, --summary_event_localization SUMMARY_EVENT_LOCALIZATION
###                         Name of the localization file to write summary
###                         localization to (overwrites) (Default:
###                         OUTPUT_l_english.yml)
###
#############################
class electoral_vote:
    def __init__(self, state, chance_1, chance_2):
        self.state = state.strip()
        self.chance_1 = int(chance_1)
        self.chance_2 = int(chance_2)
    
    def __repr__(self):
        return "%s" % (self.state)

    def __str__(self):
        return "%s, %s, %s" % (self.state, self.chance_1, self.chance_2)
    

class campaign_type(Enum):
    none = -1
    poor = 0
    middle = 2
    rich = 4

class party(Enum):
    republican = 0
    democrat = 1

US_states = dict()
candidates = set()
flags_to_clear = set()

def bool_campaign(line, indexes):
    for idx in indexes:
        if "Yes" in line[idx]:
            return idx % indexes[0]
    return -1

def read_CSV_file(name):
    print("Reading file %s\n" % name)
    with open(name, "r") as f:
        lines = f.read().splitlines()
    regions = list()
    campaigns = dict()
    last_state = ""
    last_candidate_1 = ""
    last_candidate_2 = ""
    for line in islice(lines, 1, None):
        split_line = line.split(",")

        if "Sum:" in split_line[0]:
            regions.append(list(sorted(campaigns.items(), key=lambda x: (x[0][0], x[0][1], -x[0][2], -x[0][3]))))
            #print(len(regions))
            #for key, value in regions[len(regions)-1].items():
            #    print("%s %s" %(key, value))
            campaigns = dict()
            continue

        if not split_line[6]:
            break    
        
        if split_line[0]:
            last_state = split_line[0].strip()
            US_states[last_state] = (int(split_line[2]), [x.strip() for x in split_line[1].split(";")])
        if split_line[3] and split_line[3] is not last_candidate_1:
            last_candidate_1 = split_line[3].lower().replace(" ", "_")
            candidates.add((last_candidate_1, party.republican, split_line[3]))
        if split_line[4] and split_line[4] is not last_candidate_2:
            last_candidate_2 = split_line[4].lower().replace(" ", "_")
            candidates.add((last_candidate_2, party.democrat, split_line[4]))
        if (last_candidate_1,last_candidate_2,bool_campaign(split_line, [5,7,9]),bool_campaign(split_line, [6,8,10])) in campaigns:
            campaigns[(last_candidate_1,last_candidate_2,bool_campaign(split_line, [5,7,9]),bool_campaign(split_line, [6,8,10]))].append(electoral_vote(last_state, int(split_line[11]), int(split_line[12])))
        else:
            campaigns[(last_candidate_1,last_candidate_2,bool_campaign(split_line, [5,7,9]),bool_campaign(split_line, [6,8,10]))] = [electoral_vote(last_state, int(split_line[11]), int(split_line[12]))]
    
    for idx, region in enumerate(regions):
        region_name = idx+1
        if idx in region_names_dict:
            region_name = region_names_dict[idx]
        print("Region %s: States: %s" % (region_name, region[1][1]))

    return regions   


def create_random_lists(idx, region, candidate_1, candidate_2, event_idx):
    region_name = idx+1
    if idx in region_names_dict:
        region_name = region_names_dict[idx]
    print("Creating list for region %s, candidates %s and %s" % (region_name, candidate_1, candidate_2))
    lines = list()
    for key, value in region:
        if candidate_1 not in key[0] or candidate_2 not in key[1]:
            continue
        lines.append("\t\tif = {")
        lines.append("\t\t\tlimit = {")
        if key[2] > -1:
            flag = "USA_%s_%s_%s" % (key[0], region_name.lower().replace(" ", "_"), campaign_type(key[2]).name)
            flags_to_clear.add(flag)
            lines.append("\t\t\t\thas_country_flag = %s" % flag )
        else:
            lines.append("\t\t\t\tNOT = {")
            for campaign in campaign_type:
                if campaign.value < 0:
                    continue
                flag = "USA_%s_%s_%s" % (key[0], region_name.lower().replace(" ", "_"), campaign.name)
                lines.append("\t\t\t\t\thas_country_flag = %s" % flag )
            lines.append("\t\t\t\t}")
        if key[3] > -1:
            flag = "USA_%s_%s_%s" % (key[1], region_name.lower().replace(" ", "_"), campaign_type(key[3]).name)
            flags_to_clear.add(flag)
            lines.append("\t\t\t\thas_country_flag = %s" % flag )
        else:
            lines.append("\t\t\t\tNOT = {")
            for campaign in campaign_type:
                if campaign.value < 0:
                    continue
                flag = "USA_%s_%s_%s" % (key[1], region_name.lower().replace(" ", "_"), campaign.name)
                lines.append("\t\t\t\t\thas_country_flag = %s" % flag )
            lines.append("\t\t\t\t}")
        lines.append("\t\t\t}")

        for electoral_votes in value:
            lines.append("\t\t\tif = {")
            lines.append("\t\t\t\tlimit = {")
            for state_id in US_states[str(electoral_votes.state)][1]:
                lines.append("\t\t\t\t\t%s = { is_owned_and_controlled_by = ROOT }" % state_id)
            lines.append("\t\t\t\t}")
            lines.append("\t\t\t\trandom_list = {")
            lines.append("\t\t\t\t\t%s = {" % str(electoral_votes.chance_1) )
            flag = "USA_%s_electoral_votes" % party(0).name
            flags_to_clear.add(flag)
            lines.append("\t\t\t\t\t\tmodify_country_flag = { flag = %s value = %s }" % (flag ,US_states[str(electoral_votes.state)][0]) )
            flag = "USA_%s_won_%s" % (candidate_1,str(electoral_votes.state).lower().replace(" ", "_"))
            flags_to_clear.add(flag)
            lines.append("\t\t\t\t\t\tset_country_flag = %s" % flag)
            lines.append("\t\t\t\t\t}")
            lines.append("\t\t\t\t\t%s = {" % str(electoral_votes.chance_2) )
            flag = "USA_%s_electoral_votes" % party(1).name
            flags_to_clear.add(flag)
            lines.append("\t\t\t\t\t\tmodify_country_flag = { flag = %s value = %s }" % (flag, US_states[str(electoral_votes.state)][0]) )
            flag = "USA_%s_won_%s" % (candidate_2, str(electoral_votes.state).lower().replace(" ", "_"))
            flags_to_clear.add(flag)
            lines.append("\t\t\t\t\t\tset_country_flag = %s" % flag)
            lines.append("\t\t\t\t\t}")
            lines.append("\t\t\t\t}")
            lines.append("\t\t\t}")
        lines.append("\t\t\tcountry_event = { id = %s.%s hours = 1 }" % (event_idx[0], str(event_idx[1]+idx+1)))
        lines.append("\t\t\tbreak = yes")
        lines.append("\t\t}")
    print("List for region %s created, %d lines" % (region_name, len(lines)))
    return lines

def create_event_subtracting_votes(id, index, next_index, part):
    finished_file = list()
    finished_file.append("country_event = {")
    finished_file.append("\tid = %s.%s" % (id, index))
    finished_file.append("\tis_triggered_only = yes")
    finished_file.append("\thidden = yes")
    finished_file.append("\toption = {")

    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 99 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -100 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 79 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -80 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 59 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -60 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 39 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -40 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 19 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -20 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 9 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -10 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 7 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -8 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 5 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -6 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 3 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -4 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 1 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -2 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { has_country_flag = { flag = USA_%s_electoral_votes value > 0 } }" % part.name)
    finished_file.append("\t\t\tmodify_country_flag = { flag = USA_%s_electoral_votes value = -1 }" % part.name)
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\tbreak = yes")
    finished_file.append("\t\t}")

    finished_file.append("\t}")
    finished_file.append("}")
    return finished_file

def create_event_determining_winner(id, index, next_index, end_index):
    finished_file = list()
    finished_file.append("country_event = {")
    finished_file.append("\tid = %s.%s" % (id, index))
    finished_file.append("\tis_triggered_only = yes")
    finished_file.append("\thidden = yes")
    finished_file.append("\toption = {")
    #hardcoding because i am lazy
    finished_file.append("\t\tif = {")
    finished_file.append("\t\t\tlimit = { ")
    finished_file.append("\t\t\t\thas_country_flag = { flag = USA_republican_electoral_votes value > 0 }")
    finished_file.append("\t\t\t\thas_country_flag = { flag = USA_democrat_electoral_votes value > 0 }")
    finished_file.append("\t\t\t}")
    finished_file.append("\t\t\tcountry_event = %s.%s" % (id, next_index))
    finished_file.append("\t\t\telse = {")
    finished_file.append("\t\t\t\tif = {")
    finished_file.append("\t\t\t\t\tlimit = { ")
    finished_file.append("\t\t\t\t\t\thas_country_flag = { flag = USA_republican_electoral_votes value > 0 }")
    finished_file.append("\t\t\t\t\t\thas_country_flag = { flag = USA_democrat_electoral_votes value < 1 }")
    finished_file.append("\t\t\t\t\t}")
    finished_file.append("\t\t\t\t\tset_country_flag = USA_republican_won")
    finished_file.append("\t\t\t\t\tcountry_event = { id = %s.%s hours = 1 }" % (id, end_index))
    finished_file.append("\t\t\t\t\telse = {")
    finished_file.append("\t\t\t\t\t\tif = {")
    finished_file.append("\t\t\t\t\t\t\tlimit = { ")
    finished_file.append("\t\t\t\t\t\t\t\thas_country_flag = { flag = USA_republican_electoral_votes value < 1 }")
    finished_file.append("\t\t\t\t\t\t\t\thas_country_flag = { flag = USA_democrat_electoral_votes value > 0 }")
    finished_file.append("\t\t\t\t\t\t\t}")
    finished_file.append("\t\t\t\t\t\t\tset_country_flag = USA_democrat_won")
    finished_file.append("\t\t\t\t\t\t\tcountry_event = { id = %s.%s hours = 1 }" % (id, end_index))
    finished_file.append("\t\t\t\t\t\t\telse = {")
    finished_file.append("\t\t\t\t\t\t\t\tif = {")
    finished_file.append("\t\t\t\t\t\t\t\t\tlimit = { ")
    finished_file.append("\t\t\t\t\t\t\t\t\t\thas_country_flag = { flag = USA_republican_electoral_votes value < 1 }")
    finished_file.append("\t\t\t\t\t\t\t\t\t\thas_country_flag = { flag = USA_democrat_electoral_votes value < 1 }")
    finished_file.append("\t\t\t\t\t\t\t\t\t}")
    finished_file.append("\t\t\t\t\t\t\t\t\tset_country_flag = USA_draw")
    finished_file.append("\t\t\t\t\t\t\t\t\tcountry_event = { id = %s.%s hours = 1 }" % (id, end_index))
    finished_file.append("\t\t\t\t\t\t\t\t}")
    finished_file.append("\t\t\t\t\t\t\t}")
    finished_file.append("\t\t\t\t\t\t}")
    finished_file.append("\t\t\t\t\t}")
    finished_file.append("\t\t\t\t}")
    finished_file.append("\t\t\t}")
    finished_file.append("\t\t}")
    finished_file.append("\t}")
    finished_file.append("}")
    return finished_file

def create_events_file(input, id, index):
    finished_file = list()
    new_index = index - 1
    s_candidates = sorted(candidates, key=lambda x: (x[1].value, x[0]))
    first_democrat_index = s_candidates.index(next((x for x in s_candidates if x[1] == party.democrat)))
    
    finished_file.append("")
    finished_file.append("### USA Election Simulator")
    finished_file.append("### Automatically generated by Yard1's USA Election Generator, originally for Fuhrerreich")
    
    for region in input:
        new_index = new_index + 1
        if (new_index-index) in region_names_dict:
            finished_file.append("### REGION %s" % region_names_dict[new_index-index])
        else:
            finished_file.append("### REGION %s" % str(new_index-index+1))
        finished_file.append("### STATES: %s" % region[1][1])
        finished_file.append("country_event = {")
        finished_file.append("\tid = %s.%s" % (id, new_index))
        finished_file.append("\tis_triggered_only = yes")
        finished_file.append("\tfire_only_once = yes")
        finished_file.append("\thidden = yes")
        if new_index == index:
            finished_file.append("\timmediate = {")
            for x in party:
                finished_file.append("\t\tset_country_flag = { flag = USA_%s_electoral_votes value = 0 }" % x.name)
            finished_file.append("\t}")

        for rep_candidate in islice(s_candidates, 0, first_democrat_index):
            for dem_candidate in islice(s_candidates, first_democrat_index, None):
                finished_file.append("\toption = {")
                finished_file.append("\t\ttrigger = {")
                finished_file.append("\t\t\thas_country_flag = USA_%s" % rep_candidate[0])
                finished_file.append("\t\t\thas_country_flag = USA_%s" % dem_candidate[0])
                finished_file.append("\t\t}")
                finished_file += create_random_lists(new_index-index, region, rep_candidate[0], dem_candidate[0], (id,index))
                finished_file.append("\t}")

        finished_file.append("}")
    finished_file.append("")
    return (finished_file, new_index+1)

def create_summary_event(id, index):
    s_candidates = sorted(candidates, key=lambda x: (x[1].value, x[0]))
    first_democrat_index = s_candidates.index(next((x for x in s_candidates if x[1] == party.democrat)))
    sorted_states_list = sorted(US_states.items(), key=lambda x: (x[1],x[0][0]), reverse=True)
    finished_file = list()
    tooltips_to_be_localized = collections.OrderedDict()
    event_id = ("%s.%s" % (id, index))
    finished_file.append("\n### SUMMARY EVENT")
    tooltips_to_be_localized["%s.colonnewline" % event_id] = r":\n"
    tooltips_to_be_localized["%s.newline" % event_id] = r" \n"
    finished_file.append("country_event = {")
    finished_file.append("\tid = %s" % event_id)
    tooltip = "%s.t" % event_id
    tooltips_to_be_localized[tooltip] = r"TODO"
    finished_file.append("\ttitle = %s" % tooltip)
    finished_file.append("\tdesc = \"\"")
    finished_file.append("\tpicture = CHANGEME #TODO")
    finished_file.append("\tis_triggered_only = yes")
    tooltip = "%s.d" % event_id
    tooltips_to_be_localized[tooltip] = r"TODO"
    finished_file.append("\tdesc = %s" % tooltip)
    finished_file.append("\timmediate = { ")
    flags_to_clear.add("USA_draw")
    for x in party:
        flags_to_clear.add("USA_%s_won" % x.name)
        finished_file.append("\t\tif = { \n\t\t\tlimit = { has_country_flag = USA_%s_won }" % x.name)
        for candidate in [i for i in s_candidates if i[1] == x]:
            flags_to_clear.add("USA_%s" % candidate[0])
            tooltip = "%s.%s" % (event_id, candidate[0])
            tooltips_to_be_localized[tooltip] = r"%s (%s)" % (candidate[2], candidate[1].name[0].upper())
            finished_file.append("\t\t\tif = { limit = { has_country_flag = USA_%s } custom_effect_tooltip = %s }" % (candidate[0], tooltip))
        finished_file.append("\t\t}")
    tooltip = "%s.won" % event_id
    tooltips_to_be_localized[tooltip] = r" won the elections!\n\nDetailed per state results:\n"
    finished_file.append("\t\tcustom_effect_tooltip = %s" % tooltip)
    for rep_candidate in islice(s_candidates, 0, first_democrat_index):
        finished_file.append("\t\tif = {")
        finished_file.append("\t\t\tlimit = { has_country_flag = USA_%s }" % rep_candidate[0])
        tooltip = "%s.%s" % (event_id, rep_candidate[0])
        finished_file.append("\t\t\tcustom_effect_tooltip = %s" % tooltip)
        finished_file.append("\t\t\tcustom_effect_tooltip = %s.colonnewline" % event_id)
        for state in sorted_states_list:
            tooltip = "%s.%s" % (event_id, state[0].lower().replace(" ", "_"))
            tooltips_to_be_localized[tooltip] = r"%s (%s)" % (state[0], US_states[state[0]][0])
            finished_file.append("\t\t\tif = { limit = { has_country_flag = USA_%s_won_%s } custom_effect_tooltip = %s }" % (rep_candidate[0], state[0].lower().replace(" ", "_"), tooltip ))
        finished_file.append("\t\t}")
    finished_file.append("\t\tcustom_effect_tooltip = %s.newline" % event_id)
    for dem_candidate in islice(s_candidates, first_democrat_index, None):
        finished_file.append("\t\tif = {")
        finished_file.append("\t\t\tlimit = { has_country_flag = USA_%s }" % dem_candidate[0])
        tooltip = "%s.%s" % (event_id, dem_candidate[0])
        finished_file.append("\t\t\tcustom_effect_tooltip = %s" % tooltip)
        finished_file.append("\t\t\tcustom_effect_tooltip = %s.colonnewline" % event_id)
        for state in sorted_states_list:
            tooltip = "%s.%s" % (event_id, state[0].lower().replace(" ", "_"))
            tooltips_to_be_localized[tooltip] = r"%s (%s), " % (state[0], US_states[state[0]][0])
            finished_file.append("\t\t\tif = { limit = { has_country_flag = USA_%s_won_%s } custom_effect_tooltip = %s }" % (dem_candidate[0], state[0].lower().replace(" ", "_"), tooltip ))
        finished_file.append("\t\t}")
    finished_file.append("\t}")

    finished_file.append("\toption = {")
    finished_file.append("\t\tname = %s.a" % event_id)
    finished_file.append("\t\thidden_effect = {")
    for flag in flags_to_clear:
        finished_file.append("\t\t\tclr_country_flag = %s" % flag)
    finished_file.append("\t\t}")
    finished_file.append("\t}")
    finished_file.append("}")
    finished_file.append("")
    return (finished_file, tooltips_to_be_localized)

def create_localization_file(tooltips):
    finished_file = list()
    finished_file.append("l_english:")
    for tooltip in tooltips.items():
        finished_file.append(" %s:0 \"%s\"" % (tooltip[0], tooltip[1]))
    return finished_file

###################################################################
if not sys.version_info >= (3,0):
    sys.exit("Wrong Python version. Version 3.0 or higher is required to run this script!")
parser = argparse.ArgumentParser(description='Given a properly formatted .csv file, create HoI 4 events simulating counting of votes USA elections (first past the post). Originally written for Fuhrerreich mod.')
parser.add_argument('input',
                    help='Fuhrerreich .csv USA elections file')
parser.add_argument('namespace',
                    help='Event ID namespace (Example: "usa.election.1936")')
parser.add_argument('starting_event_id_index',
                    help='A free event ID index (Example: "2")')
parser.add_argument( 'output',
                    help='Name of HoI4 event file to write to (appends)')
parser.add_argument('-r', '--region_names', required=False, default="",
                    help='Optional region names separated by comma "," ordered as in the .csv file (Example: "West,North Central,Southeast,Northeast"). If not given, indexes will be used instead.')
parser.add_argument( '-s', '--summary_event', action='store_true', required=False, default=False,
                    help='Generate summary and winner determination events? (Default: False)')
parser.add_argument( '-loc', '--summary_event_localization', required=False, default="",
                    help='Name of the localization file to write summary localization to (overwrites) (Default: OUTPUT_l_english.yml)')
args = parser.parse_args()
args.summary_event_localization = "%s_l_english.yml" % args.output.split(".")[0]
region_names_dict = dict()
if args.region_names:
    args.region_names = args.region_names.split(",")
    for idx, name in enumerate(args.region_names):
        region_names_dict[idx] = name.strip()
parsed_csv = read_CSV_file(args.input)
print("\nFile %s read successfully!" % (args.input))
print("Adding to event file %s...\n" % (args.output))
events_file = create_events_file(parsed_csv, args.namespace, int(args.starting_event_id_index))
events_file_l = events_file[0]
if args.summary_event:
    #has to be done two times since an event cannot call itself
    events_file_l.append("### EVENTS TO DETERMINE WINNER")
    idx = events_file[1]
    end_idx = idx+(len(party)*2)
    for i, x in enumerate(party):
        events_file_l += create_event_subtracting_votes(args.namespace, idx, idx+1, x)
        temp = events_file[1] if i == len(party)-1 else idx+2
        events_file_l += create_event_determining_winner(args.namespace, idx+1, temp, end_idx)
        idx = idx+2
        
    summary_event = create_summary_event(args.namespace, end_idx)
    events_file_l += summary_event[0]
    with open(args.summary_event_localization, encoding='utf-8-sig', mode="w") as f:
        f.writelines(str(line) + "\n" for line in create_localization_file(summary_event[1]))

with open(args.output, encoding='utf-8-sig', mode="a") as f:
        f.writelines(str(line) + "\n" for line in events_file_l)
print("\nFile %s written to successfully!" % (args.output))
#createHOI4ideasfile(args.output, ministers, country_tag)
#print("Ideas file %s created successfully" % args.output)
