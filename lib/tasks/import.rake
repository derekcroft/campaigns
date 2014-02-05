task 'teams:import' => [:environment] do
  Team.import!
end

task 'dancers:import' => [:environment] do
  Dancer.import!
end
