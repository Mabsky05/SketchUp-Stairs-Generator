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

# code for getting step heights
def list (stair_ht, min, max)
  riser_list = []
  avg_riser_ht = (min + max) / 2
  step_number = stair_ht / avg_riser_ht
  rem1 = stair_ht % avg_riser_ht
  step_add = rem1 / (step_number - 1)
  rem2 = rem1 % (step_number - 1)
  riser_bottom = avg_riser_ht + rem2
  riser_rest = avg_riser_ht + step_add
  
  riser_list.append(riser_bottom)
  
  risers = 1
  while risers < step_number
    (riser_list.append(riser_rest))
    risers += 1
  end
  
  puts avg_riser_ht
  puts step_number
  puts rem1
  puts rem2
  puts step_add
  puts riser_bottom
  puts riser_rest
  puts "XXX"
  p riser_list
end

=begin
draw a line from pts 
0,0,0
0, 250, 0 = bot1
0, 0, 150
0, 250, 150
0, 250, 300
0, 500, 300
0, 500, 450
0, 750, 450
0, 750, 300 = bot2

