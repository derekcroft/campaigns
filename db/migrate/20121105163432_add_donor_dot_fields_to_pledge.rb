class AddDonorDotFieldsToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :dot_color, :string, limit: 6, default: '000000'
    add_column :pledges, :dot_comment, :string, limit: 255
  end
end
