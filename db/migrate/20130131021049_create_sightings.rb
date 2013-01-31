class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.string :city
      t.string :state
      t.datetime :sighted_at
      t.integer :duration
      t.datetime :posted_at
      t.string :shape
      t.text :summary
      t.integer :match_score
      t.decimal :x_coord
      t.decimal :y_coord

      t.timestamps
    end
  end
end
