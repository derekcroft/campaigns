class AddDonateCapToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :donate_cap, :boolean

  end
end
