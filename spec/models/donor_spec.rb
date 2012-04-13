require 'spec_helper'

describe Donor do
  describe "#donation_amount" do
    let(:donor) { FactoryGirl.create :donor }
    it "is zero if they have no pledges" do
      donor.donation_amount.should == 0
    end
  end
end
