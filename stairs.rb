#Generate stairs
#TODO everything!

model = Sketchup.active_model
ent = model.entities

#Get step heights
def list(stair_ht, min, max, step_length)
  riser_list = []
  avg_riser_ht = (min + max) / 2
  step_number = stair_ht / avg_riser_ht
  rem1 = stair_ht % avg_riser_ht
  step_add = rem1 / (step_number - 1)
  rem2 = rem1 % (step_number - 1)
  riser_init = avg_riser_ht + rem2
  riser_rest = avg_riser_ht + step_add
  tread = step_length
  
  def riser_tread(riser_init, riser_rest, step_number, tread)
    steps_list = [ [0, 0, 0], [0, 0, riser_init], [0, tread, riser_init], [0, tread, riser_init + riser_rest]]
    points_list = []
    riser_start = riser_init + riser_rest
    tread_start = tread
    
        steps = 0
        while steps < step_number
          steps += 1
  
            if steps % 2 == 0
              riser_start = riser_start + riser_rest
              steps_list.append([0, tread_start, riser_start])
    
            else
              tread_start = tread_start + tread
              steps_list.append([0, tread_start, riser_start])
  
            end          
        end
  

        Sketchup.active_model.entities.add_line (steps_list)
  end
  riser_tread(riser_init, riser_rest, step_number, tread)

end


list(3000, 160, 180, 250)


  




