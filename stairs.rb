#Generate stairs
#TODO everything!

model = Sketchup.active_model
ent = model.entities

#always add mm to specify lengths



#code for storing step heights

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
end



#test stair
#draw stair outline from pts 
pta = [0 ,0 ,0]
ptb = [0, 250.mm, 0] #bot1]
ptc = [0, 0, 150.mm]
pt1 = [0, 250.mm, 150.mm]
pt2 = [0, 250.mm, 300.mm] 
pt3 = [0, 500.mm, 300.mm]
pt4 = [0, 500.mm, 450.mm]
pt5 = [0, 750.mm, 450.mm]
ptd = [0, 750.mm, 300.mm] #bot2

#extrude to x/y axis
stairface = ent.add_face pt1, pt3, pt4, pt5, pt6, pt7, pt8, pt9, pt2, pt1
stairface.pushpull 900.mm


#how to loop function into code?
=begin

INIT
pta = [0,0,0]
ptb = [0, trd_length, 0]
ptc = [0, 0, riser_bottom]
ptd = [0, trd_length, riser_rest]

REST

pt1 = [0, trd_length, riser_rest + riser_rest]
pt2 = [0, trd_length + trd_length, riser_rest + riser_rest]
pt3 = [0, trd_length + trd_length, riser_rest + riser_rest + riser_rest]...

pt1 = tl, rr
pt2 = tl, += rr
pt3 = +=tl, rr
pt4 = tl, += rr

for steps = 1,
  while steps < say, 15
    steps + 1
      if steps % 2 != 0
        steps_list.append[0, tl*steps, rr]
        tl = tl*steps
      else
        steps_list.append[0, tl, rr *steps]
        rr = rr* steps

Test!
=end


  
