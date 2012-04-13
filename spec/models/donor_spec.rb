require 'spec_helper'

describe Donor do
  describe "#donation_amount" do
    let(:donor) { FactoryGirl.create :donor }
    it "is zero if they have no pledges" do
      donor.donation_amount.should == 0
    end

    context "for a fixed pledge" do
      before(:each) do
        donor.pledges.create(pledge_type: 'fixed', amount: 52.50)
      end

      it { donor.pledges.count.should == 1 }
      it { donor.donation_amount.should == 52.50 }

      context "and then a second fixed pledge" do
        before(:each) do
          donor.pledges.create(pledge_type: 'fixed', amount: 1.05)
        end

        it { donor.pledges.count.should == 2 }
        it { donor.donation_amount.should == 53.55 }
      end
    end
  end
end
