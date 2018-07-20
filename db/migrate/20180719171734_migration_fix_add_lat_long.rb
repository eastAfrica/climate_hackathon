class MigrationFixAddLatLong < ActiveRecord::Migration[5.2]
  def change
      add_column :districts, :lat, :decimal, {:precision=>10, :scale=>6}
      add_column :districts, :long, :decimal, {:precision=>10, :scale=>6}
  end
end
