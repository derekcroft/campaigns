class Pledge < ActiveRecord::Base

  belongs_to :donor

  attr_accessible :stripe_card_token, :pledge_type, :amount, :cap

  validates :pledge_type, inclusion: { in: %w{fixed penny} }
  validates :donor, presence: true

end
