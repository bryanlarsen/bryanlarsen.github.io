require 'rubygems'
require 'erubis'

def image(filename, ext)
  File.file?(File.dirname(__FILE__) + "/../images/960/#{filename}.#{ext}") ? "#{filename}.#{ext}" : nil
end

pictures = {
  'aerial_farm' => {'caption' => 'Aerial view of the farm 2003'},
  'house_corner' => {'caption'=> 'House South East'},
  'house_south_west' => {'caption' => 'House Southwest corner'},
  'house_from_east' => {'caption' => 'House from East'},
  'living_room' => {'caption' => 'Living room' },
  'living_room_2' => {'caption' => 'Living room' },
  'kitchen' => {'caption' => 'Kitchen' },
  'kitchen_2' => {'caption' => 'Kitchen' },
  'dining_room' => {'caption' => 'Dining room' },
  'dining_room_2' => {'caption' => 'Dining room' },
  'master_bedroom' => {'caption' => 'Master Bedroom'},
  'master_bedroom_2' => {'caption' => 'Master Bedroom'},
  'bedroom_2' => {'caption' => 'Bedroom 2'},
  'bedroom_2_2' => {'caption' => 'Bedroom 2'} ,
  'walkin_closet' => {'caption' => 'Bedroom 2'} ,
  'main_bathroom' => {'caption' => 'Main Bathroom'},
  'multipurpose_room' => {'caption' => 'Multipurpose Room'},
  'multipurpose_room_2' => {'caption' => 'Multipurpose Room'},
  'bathroom_basement' => {'caption' => 'Bathroom Lower Level'},
  'bedroom_3' => {'caption' => 'Bedroom 3'},
  'bedroom_4' => {'caption' => 'Bedroom 4'},
  'bedroom_5' => {'caption' => 'Bedroom 5'},
  'machine_shed' => {'caption' => 'Machine Shed'},
  'farm_from_dugout' => {'caption' => 'Shop from dugout'},
  'farm_from_road' => {'caption' => 'Farm from Road'},
  'front_yard_looking_south_barn' => {'caption' => 'Front yard looking south at Barn'},
  'bins_and_barn_2' => {'caption' => 'Bins and the barn' },
  'bins_power' => {'caption' => 'Power to the bins'},
  'cattle_shed' => {'caption' => 'Cattle Shed'},
  'water_bowl' => {'caption' => 'Water Bowl'},
  'garden_4' => {'caption' => 'Garden'},
  'misc_buildings' => {'caption' => 'Misc Buildings and Sheds'},
  'apple_tree' => {'caption' => 'Apple Tree'},
  'living_room' => {'caption' => 'Living Room'},
  'se26' => {'caption' => 'SE26 looking north'},
  'laval_quarter_looking_south_east' => {'caption' => 'SE26 looking south east'},
  'ne26' => {'caption' => 'NE26 looking south west'},
  'ne27' => {'caption' => 'NE27 looking south west'},
  'oil_battery_2' => {'caption' => 'Oil Battery'},
  'pumpjack_and_farm' => {'caption' => 'Pumpjack and Farm'},
  'pumpjack_2' => {'caption' => 'Pumpjack and Farm'},
  'landbank' => {'caption' => 'NE23 North parcel looking south'},
  'landbank_south' => {'caption' => "NE23 South parcel looking east"},
  'dugout_center' => {'caption' => 'Dugout NE side of SW26'},
  'sw_of_26' => {'caption' => 'Southwest of SW26'},
  'breaking' => {'caption' => 'NW27  West side pasture'},
  'breaking_2' => {'caption' => 'NW27 East side crop land'}
}

pictures.each do |k,v|
  if v.has_key?('file') then
    pictures[k]['file'] = image(v['file'], 'JPG') || image(v['file'], 'jpg')
  else
    pictures[k]['file'] = "#{k}.jpg"
  end
end

def process_images(context)
  path = File.dirname(__FILE__) + '/../picture.html.erb'
  input = File.read(path)
  eruby = Erubis::Eruby.new(input)    # create Eruby object
  context.each do |k,v|
    File.open(File.dirname(__FILE__) + '/../pictures/' + k + '.html', 'w+') do |f|
      f << eruby.result(v)
    end
  end
end

process_images(pictures)