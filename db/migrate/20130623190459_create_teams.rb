class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :captain_first_name
      t.string :captain_last_name
      t.string :captain_email
      t.string :name
      t.string :program
      t.string :sport
      t.string :charity
      t.date :sourced_on
      t.string :url

      t.timestamps
    end
  end
end
