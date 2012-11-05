class IncreaseSizeOfDotColorField < ActiveRecord::Migration
  def change
    change_column :pledges, :dot_color, :string, limit: 7, default: '#000000'
  end
end
