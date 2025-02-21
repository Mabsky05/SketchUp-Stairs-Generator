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


def riser_tread(riser_init, riser, tread, steps_total)
  steps_list = [ [0, 0, 0], [0, 0, riser_init], [0, tread, riser_init], [0, tread, riser_init + riser]]
  points_list = []
  riser_start = riser_init + riser
  tread_start = tread
  
      steps = 0
      while steps < steps_total
        steps += 1

          if steps % 2 == 0
            riser_start = riser_start + riser
            steps_list.append([0, tread_start, riser_start])
  
          else
            tread_start = tread_start + tread
            steps_list.append([0, tread_start, riser_start])

          end
          
          
      end
    
  p steps_list
  
  
  end
  
  riser_tread(160, 170, 250, 5)
  

