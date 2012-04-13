class AddDonorIdToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :donor_id, :integer
  end
end
