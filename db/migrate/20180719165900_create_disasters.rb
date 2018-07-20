class CreateDisasters < ActiveRecord::Migration[5.2]
  def change
    create_table :disasters do |t|
      t.string :event
      t.integer :province_id
      t.integer :district_id
      t.integer :sector_id
      t.datetime :date_of_occurence
      t.string :location
      t.integer :deaths
      t.integer :injured
      t.integer :missing
      t.integer :houses_destroyed
      t.integer :houses_damaged
      t.integer :directly_affected
      t.string :indirectly_affected
      t.integer :relocated_people
      t.integer :evacuated_people
      t.integer :losses_usd
      t.integer :losses_local
      t.string :damages_crops_hectares
      t.integer :lost_cattle
      t.integer :damages_roads_meters
      t.string :comments

      t.timestamps
    end
  end
end
