require 'nori'

data = Nori.new.parse(IO.read("ufo_locations.kml"))

data["kml"]["Document"]["Folder"]["Placemark"].each do |placemark|

end


