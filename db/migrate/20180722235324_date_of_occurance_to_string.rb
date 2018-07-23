class DateOfOccuranceToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :disasters, :date_of_occurence
    add_column :disasters, :date_of_occurence, :string
  end
end
