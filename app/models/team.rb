require 'csv'

class Team < ActiveRecord::Base
  attr_accessible :captain_email, :captain_first_name, :captain_last_name, :charity, :name, :program, :sourced_on, :sport, :url

  def self.import!
    CSV.foreach(File.join(Rails.root, 'db', "lts_teams.csv"), headers: :first_row) do |row|
      Team.where(name: row['Team']).first_or_create(
        captain_first_name: row['First Name'],
        captain_last_name: row['Last Name'],
        captain_email: row['Email'],
        name: row['Team'],
        program: row['Program'],
        sport: row['Sport'],
        charity: row['What do YOU play for?!'],
        sourced_on: row['Source File Date'],
        url: row['Team URL']
      )
    end
  end

  def self.teams_and_charities
    Team.order(:name).all.collect {|t| ["#{t.name} / #{t.charity}", t.id]}
  end

  def self.teams_and_charities_all
    Team.order(:name).uniq.collect do |team|
      {
        description: "#{team.name} / #{team.charity}",
        team_id: team.id
      }
    end
  end

  def self.teams_and_charities_by_sport
    Team.order(:name).uniq.inject({}) do |accum, team|
      teams_for_sport = accum.fetch(team.sport, [])
      teams_for_sport << {
        description: "#{team.name} / #{team.charity}",
        team_id: team.id
      }
      accum.store(team.sport, teams_for_sport)
      accum
    end
  end

  def self.sports
    Team.select(:sport).order(:sport).uniq.collect(&:sport)
  end

  def subdomain
    url.split('/').last
  end

end
