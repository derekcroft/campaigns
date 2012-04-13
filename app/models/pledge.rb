class Pledge < ActiveRecord::Base
  belongs_to :donor
  attr_accessible :stripe_card_token, :pledge_type, :amount
end
