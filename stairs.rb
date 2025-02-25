model = Sketchup.active_model
ent = model.entities
Sketchup.active_model.options

#Create input box
# prompts = ["stair height", "minimum riser height", "maximum riser height", "step_length"]
# results = inputbox prompts

# stair_ht = Float(results[0])
# min = Float(results[1])
# max = Float(results[2])
# step_length = Float(results[3])


#Restriction clauses
# if min < 150
#   puts "minimum riser height is less than 130"
# end

#Get step heights
def list(stair_ht, min, max, step_length)
  avg_riser_ht = (min + max) / 2
  step_number = (stair_ht / avg_riser_ht).floor
  rem1 = stair_ht % (avg_riser_ht)
  step_add = rem1 / (step_number - 1)
  rem2 = rem1 % (step_number - 1)
  riser_init = stair_ht - ((step_number - 1) * (avg_riser_ht + step_add))
  riser_rest = avg_riser_ht + step_add
  tread = step_length
   
  def riser_tread(riser_init, riser_rest, step_number, tread)
    steps_list = [ [0, 0, 0], [0, 0, riser_init], [0, tread, riser_init], [0, tread, riser_init + riser_rest]]
    riser_start = riser_init + riser_rest
    tread_start = tread    
        steps = 0
        while steps < ((step_number * 2) -3)
          steps += 1
  
            if steps % 2 == 0
              riser_start = riser_start + riser_rest
              steps_list.append([0, tread_start, riser_start])
    
            else
              tread_start = tread_start + tread
              steps_list.append([0, tread_start, riser_start])
  
            end          
        end
    pt_anchor1 =[0, tread, 0]
    Geom::Point3d.new (steps_list.last)


        
    Sketchup.active_model.entities.add_line (steps_list)
    # Sketchup.active_model.entities.add_line pt_anchor1, pt_anchor2
        p steps_list
  end
  riser_tread(riser_init, riser_rest, step_number, tread)

end


# list(stair_ht.mm, min.mm, max.mm, step_length.mm)

# list(stair_ht, min, max, step_length)
list(2463.mm, 170.mm, 180.mm, 240.mm)




