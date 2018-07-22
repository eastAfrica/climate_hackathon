
class MigrationFixDistrictTable < ActiveRecord::Migration[5.2]
  def change
      remove_column :districts, :point
  end

end
