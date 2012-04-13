class AddCapToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :cap, :decimal, precision: 10, scale: 2

  end
end
