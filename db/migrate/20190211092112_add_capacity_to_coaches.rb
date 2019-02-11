class AddCapacityToCoaches < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :capacity, :integer
  end
end
