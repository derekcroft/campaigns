task 'teams:import' => [:environment] do
  Team.import!
end
