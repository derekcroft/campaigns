class AddUrlToDancers < ActiveRecord::Migration
  def change
    add_column :dancers, :sequence, :integer
  end
end
