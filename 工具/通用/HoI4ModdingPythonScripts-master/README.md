# HoI4ModdingPythonScripts
Various useful Python scripts to automate some tedious parts of Hearts of Iron 4 modding. Written in Python 2.7 (python2 folder) and Python 3.5 (python3 folder).

Readmes and usage instructions are included as comments in .py source files.

Python 2.7 scripts may work on Python 3.\* but that is not guaranteed. Same goes for the other way around.

Scripts included:

- hoi4transfertechsegen.py - HoI 4 Transfer Technology scripted effect generator - generates a transfer_technology scripted effect, which grants all technologies researched by one country to another.
- hoi4localisationadder.py - HoI 4 Localisation Adder - adds empty localisation entries from a given event, national_focus or idea file.
- hoi4focusgfxentry.py - HoI 4 Focus GFX entry generator - adds GFX entries from national_focus files.
- DHtoHoi4MinisterConverter.pt - HoI Darkest Hour minister to HoI4 idea converter - converts Hearts of Iron Darkest Hour minister files to Hearts of Iron IV ideas, following a format specified by HoI4 Darkest Hour mod by Algerian General. Handles Unicode characters.
- hoi4ideagfxentry.py - Idea GFX entry generator- generates idea GFX entries for all ideas in a given file.
- hoi4fileformatter.py - Indents files for readability and consistency.
- USAElectionGenerator.py - Generates events simulating first-past-the-post elections (US style) using a .csv spreadsheet.
- hoi4statemapgenerator.py - Generates an image file of a map with every state/strategic region having a separate color and ID.  Examples: Vanilla: https://cdn.discordapp.com/attachments/463044308002406402/465588079579758602/out.png EaW: https://cdn.discordapp.com/attachments/463044308002406402/465591100237676554/out.png

MIT license (LICENSE) applies to every file in this repository.
