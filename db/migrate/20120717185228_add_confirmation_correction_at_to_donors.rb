class AddConfirmationCorrectionAtToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :confirmation_correction_at, :datetime

  end
end
