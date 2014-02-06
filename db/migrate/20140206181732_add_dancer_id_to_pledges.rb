class AddDancerIdToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :dancer_id, :integer
  end
end
