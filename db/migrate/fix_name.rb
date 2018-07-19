class CreateSectors < ActiveRecord::Migration[5.2]
  def change
    #change_column(:district, :point, :point)
    change_column :district, :point, :point
  end
end
