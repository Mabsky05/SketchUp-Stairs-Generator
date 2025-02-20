#Generate stairs
#TODO instructions
#TODO everything!

model = Sketchup.active_model
ent = model.entities

#always add mm to specify lengths


#stair face
pt1 = [0, 0, 0]
pt2 = [0, 250.mm, 0]
pt3 = [900.mm, 250.mm, 0]
pt4 = [900.mm, 0, 0]
stairface = ent.add_face pt1, pt2, pt3, pt4

#push out stair face
stairface.reverse!
stairface.pushpull 180.mm

=begin 
for riser number...
-give riser range (ex. 150 - 180)    
-give a height in mm (ex. 3111)
-divide height by mid stair riser value (no float, ex. 3111 / 165 = 18 from 18.85)
-get remainder (141), divide by number of steps minus 1 (no float, 141 / 17 = 8 from 8.294)
-get remainder (136), subtract from 141 (5)
-distribute remainder to bottom riser, add rest (8) to other risers 
-create list (bottom riser, other risers)

function (min max):


-add number to height to make it a multiple of 5 (3111 + 4) = 3115
-subtract number from first step: 180 - 4 = 176



