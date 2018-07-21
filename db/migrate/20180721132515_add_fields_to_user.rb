class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :sector_id, :integer
      add_column :users, :district_id, :integer
      add_column :users, :phone_number, :string
  end
end
