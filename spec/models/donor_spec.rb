require 'spec_helper'

describe Donor do
  describe "#donation_amount" do
    let(:donor) { FactoryGirl.create :donor }
    it "is zero if they have no pledges" do
      donor.donation_amount.should == 0
    end

    context "for a fixed pledge" do
      before(:each) do
        donor.pledges.create(pledge_type: 'fixed')
      end

      it { donor.pledges.count.should == 1 }
    end
  end
end
