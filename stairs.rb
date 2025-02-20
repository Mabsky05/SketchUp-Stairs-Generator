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

#new_line = ent.add_line pt1, pt2, pt3, pt4, pt1

stairface = ent.add_face pt1, pt2, pt3, pt4
stairface.reverse!
#box = new_line.bounds

