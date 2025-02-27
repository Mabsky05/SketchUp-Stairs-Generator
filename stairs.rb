model = Sketchup.active_model
ent = model.entities
# Sketchup.active_model.options

# Create input box
prompts = ["stair height", "minimum riser height", "maximum riser height", "step_length", "width of stairs"]
results = inputbox prompts

stair_ht = Float(results[0])
min = Float(results[1])
max = Float(results[2])
step_length = Float(results[3])
width = Float(results[4])

#Restriction clauses
# if min < 150
#   puts "minimum riser height is less than 130"
# end

list(stair_ht.mm, min.mm, max.mm, step_length.mm, width.mm)

#Get step heights
def list(stair_ht, min, max, step_length, width)
  
  #average of two given riser values, ideally based on building code
  avg_riser_ht = (min + max) / 2
  
  #number of steps (round down to integer)
  step_number = (stair_ht / avg_riser_ht).floor
  
  # remainder from rounding down
  rem1 = stair_ht % (avg_riser_ht)
  
  # remainder to be added to each riser except first 
  step_add = rem1 / (step_number - 1)
  
  # first riser height = subtract total 'padded' risers from height 
  riser_init = stair_ht - ((step_number - 1) * (avg_riser_ht + step_add))

  # riser heights for rest of risers 
  riser_rest = avg_riser_ht + step_add
  
  tread = step_length
  width = width

  #Create stair face and extrude 
  def riser_tread(riser_init, riser_rest, step_number, tread, width)
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

    vector = Geom::Vector3d.new(0,0,-riser_rest)
    tr = Geom::Transformation.translation(vector)
    pt_anchor1 =[0, tread, 0]
    pt_anchor2 = tr * (steps_list.last)

    steps_list.prepend(pt_anchor1)
    steps_list.append(pt_anchor2)
    steps_list.append(pt_anchor1)
    stair_face = Sketchup.active_model.entities.add_face (steps_list)
    stair_face.pushpull(width)
  end

  riser_tread(riser_init, riser_rest, step_number, tread, width)

end

#testing input for console
# list(2463, 170, 180, 240, 800)




