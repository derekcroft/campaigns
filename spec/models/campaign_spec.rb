require 'spec_helper'

describe Campaign do
  context "#percent_complete" do
    let(:campaign) { FactoryGirl.build(:campaign) }

    it "is 0% if donation_total is nil" do
      campaign.donation_total = nil
      campaign.donation_target = 4000
      campaign.percent_complete.should == 0
    end

    it "is 0%" do
      campaign.donation_total = 0
      campaign.donation_target = 5000
      campaign.percent_complete.should == 0
    end

    it "is 25%" do
      campaign.donation_total = 4000
      campaign.donation_target = 16000
      campaign.percent_complete.should == 25
    end

    it "is 33%" do
      campaign.donation_total = 5000
      campaign.donation_target = 15000
      campaign.percent_complete.should == 33
    end

    it "is 50%" do
      campaign.donation_total = 6000
      campaign.donation_target = 12000
      campaign.percent_complete.should == 50
    end

    it "is 67%" do
      campaign.donation_total = 14000
      campaign.donation_target = 21000
      campaign.percent_complete.should == 67
    end

    it "is 100%" do
      campaign.donation_total = 8000
      campaign.donation_target = 8000
      campaign.percent_complete.should == 100
    end

    it "is 100% if donations exceed target" do
      campaign.donation_total = 9000
      campaign.donation_target = 7000
      campaign.percent_complete.should == 100
    end

  end
end
