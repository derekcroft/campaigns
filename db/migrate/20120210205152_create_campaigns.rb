class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.decimal :donation_total, precision: 20, scale: 2
      t.decimal :donation_target, precision: 20, scale: 2
      t.integer :number_of_donors
      t.timestamps
    end
  end
end
