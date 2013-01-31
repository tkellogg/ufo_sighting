class Sighting < ActiveRecord::Base
  attr_accessible :city, :duration, :match_score, :posted_at, :shape, :sighted_at, :state, :summary, :x_coord, :y_coord
end
