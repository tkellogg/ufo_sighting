namespace :ufo do
  desc "Parse the data"
  task :parse => :environment do
    data = Nori.new.parse(IO.read("ufo_locations.kml"))

    p "Parsing #{data["kml"]["Document"]["Folder"]["Placemark"].count}"

    i = 0

    sleep 5

    data["kml"]["Document"]["Folder"]["Placemark"].each do |placemark|
      Sighting.create(
          :city => placemark["ExtendedData"]["SchemaData"]["SimpleData"][0],
          :state => placemark["ExtendedData"]["SchemaData"]["SimpleData"][1],
          :sighted_at => placemark["ExtendedData"]["SchemaData"]["SimpleData"][2],
          :duration => placemark["ExtendedData"]["SchemaData"]["SimpleData"][3].to_i,
          :posted_at => Date.strptime(placemark["ExtendedData"]["SchemaData"]["SimpleData"][4], '%m/%d/%Y'),
          :shape => placemark["ExtendedData"]["SchemaData"]["SimpleData"][5],
          :summary => placemark["ExtendedData"]["SchemaData"]["SimpleData"][6],
          :match_score => placemark["ExtendedData"]["SchemaData"]["SimpleData"][7],
          :x_coord => placemark["Point"]["coordinates"].split(",")[0].to_d,
          :y_coord => placemark["Point"]["coordinates"].split(",")[1].to_d
      )
      p "#{i}: #{placemark["Point"]["coordinates"]}"
    end
  end
end