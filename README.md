# SketchUp: Stairs Generator

<img src = "references/input_box.png" height = "300"/>
<img src = "references/data_box.png" height = "300"/>
<img src = "references/stairs.png" height = "300"/>


[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## What's this?

Ruby code for auto generating a staircase, in SketchUp</br>

All you need to know are: </br>

The height of the stairs (from the ground to the next level) </br>
The minimum and maximum heights for each step (from building code, preferably) </br>
The length for each step </br>


## How to Use
From top bar of SketchUp UI: </br>
Extensions > Developer > Ruby Console </br> 
Load .rb file from save location by inputting load plus file location. </br>
Ex. "load C:/[username]/[script name.rb]" </br>

Or copy-paste stairs.rb file contents to console. </br>

Then hit Enter. 

## Usage / Instructions

Upon running the code, a prompt box appears with default values for the following: </br>

stair height (floor to top of stair, mm) </br>
minimum riser height (mm) </br>
maximum riser height (mm) </br>
step length (mm) </br>
width of stairs (mm) </br>
add rail (Y or N?) </br>

Edit desired values and click OK. </br> 
A window showing stair data appears. click OK. </br>
A stair group will be generated with the desired values. </br> 

Entering 'y' for the 'add rail' option will generate 50mm diameter rails. These will be
900mm O.C above the stair steps, and extend 300mm horizontally from the ends of the stairs. 

## What the code actually does

Steps:</br> 
1) Divide height by the average of the min and max riser heights to get number of steps</br>
2) Distribute remainder of quotient to risers, such that heights are evenly distributed
in reasonable dimensions. In this process all riser heights will be equal, except the first </br>
3) Draw a (poly)line surface tracing the stair outline.</br>
4) Extrude this surface to set the stair width</br>
5) Railings: get and move stair points, then extrude a circular surface perpendicular to these points. </br>
6) Transform stair into component for ease of use. </br> 

## Log

### 08/03/2025
Code complete </br>
possible TODO: group rails </br>
Added licence and updated readme.md

### 08/03/2025
Base code input generates stairs and railings </br>
TODO:</br>
Options: to put railings or not</br>
Refining railing to fit on stair edge</br>
Warnings for unusual stair dimensions (not following building code)</br>
Informing users on dimensions of stairs and widths</br>
Simplify: code is too wordy</br>

### 27/02/2025
Base code working: can now add surface and extrude stairs to width.</br>
Added comments for clarity.</br>
To add:</br>
UI limits (i.e., alerting wrong inputs on UI)</br>
Railing</br>
Save as component</br>

### 25/02/2025
Repo renamed to stairs.rb, will focus on only one script.</br>
Code now produces basic stair outline, rest to follow.</br>
To add: </br>
Stair surface, then extrude</br>
UI limits (i.e., alerting wrong inputs on UI)</br>
Railing</br>
Save as component</br>

### 20/02/2025
first upload - stairs.rb in progress

