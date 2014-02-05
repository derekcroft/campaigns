class CreateDancers < ActiveRecord::Migration
  def change
    create_table :dancers do |t|
      t.string :confirmation
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
