class AddTeamIdToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :team_id, :integer
  end
end
