# SketchUp: Stairs given Floor to Ceiling heights

## Usage
Extensions > Developer > Ruby Console </br> 
Load .rb file from save location by inputting load plus file location. </br>
Ex. "load C:/[username]/[script name.rb]" </br>

Or copy-paste script contents to console.

## Summary 
Stairs are generated on inputting the following: </br>
Height (floor to floor/ceiling) </br>
minimum riser height </br>
maximum riser height </br>
tread depth </br>

Steps:</br> 
1) Divide height by the average of the min and max riser heights to get number of steps</br>
2) Distribute remainder of quotient to risers, such that heights are evenly distributed
in reasonable dimensions. In this process all riser heights will be equal, except the first </br>
3) Draw a (poly)line surface tracing the stair outline.</br>
4) Extrude this surface to set the stair width</br>
5) Add railings </br>
6) Transform model into component for ease of use. </br> 



## Log

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

