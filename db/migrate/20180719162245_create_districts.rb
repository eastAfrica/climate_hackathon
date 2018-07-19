  class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :province_id
      t.integer :point
      t.integer :point

      t.timestamps
    end
  end
end
