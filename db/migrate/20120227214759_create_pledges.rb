class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :campaign
      t.timestamps
    end
  end
end
