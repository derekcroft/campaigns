require 'spec_helper'

describe Campaign do
  context "#donation_total" do
    describe "dollar matching" do
      let(:campaign) { FactoryGirl.create(:campaign, match_amount: 100, campaign_type: 'dollar') }
      subject { campaign }

      context "with a dollar donor" do
        let(:donor) { FactoryGirl.create :donor, campaign: campaign }

        before(:each) do
          donor.pledges.create!(pledge_type: 'dollar')
        end

        its(:donation_total) { should == 1.00 }

        context "and three more dollar donors" do
          let(:donors) { FactoryGirl.create_list :donor, 3, campaign: campaign }

          before(:each) do
            donors.each { |donor| donor.pledges.create!(pledge_type: 'dollar') }
          end

          its(:donation_total) { should == 16.00 }

          context "one of whom has a cap of $2.00" do
            before(:each) do
              donors.second.pledges.first.update_attribute(:cap, 2.00)
            end

            its(:donation_total) { should == 14.00 }
          end
        end
      end
    end

    describe "penny matching" do
      let(:campaign) { FactoryGirl.create(:campaign, match_amount: 1, campaign_type: 'penny') }
      subject { campaign }

      its(:donation_total) { should == 0.00 }

      context "with a fixed donor" do
        let(:donor) { FactoryGirl.create :donor, campaign: campaign }

        before(:each) do
          donor.pledges.fixed.create!(amount: 5.21)
        end

        its(:donation_total) { should == 5.21 }

        context "and a second fixed donor" do
          before(:each) do
            donor.pledges.fixed.create(amount: 1.05)
          end

          its(:donation_total) { should == 6.26 }
        end
      end

      context "with a penny donor" do
        let(:donor) { FactoryGirl.create :donor, campaign: campaign }

        before(:each) do
          donor.pledges.create!(pledge_type: 'penny')
        end

        its(:donation_total) { should == 0.01 }

        context "and three more penny donors" do
          let(:donors) { FactoryGirl.create_list :donor, 3, campaign: campaign }

          before(:each) do
            donors.each { |donor| donor.pledges.create!(pledge_type: 'penny') }
          end

          its(:donation_total) { should == 0.16 }

          context "one of whom has a cap of $0.02" do
            before(:each) do
              donors.second.pledges.first.update_attribute(:cap, 0.02)
            end

            its(:donation_total) { should == 0.14 }
          end
        end
      end
    end
  end

  context "#donation_total_complete_percent" do
    let(:campaign) { FactoryGirl.build(:campaign) }

    it "is 0% if donation_total is nil" do
      campaign.stub(:donation_total).and_return(nil)
      campaign.donation_target = 4000
      campaign.donation_total_complete_percent.should == 0
    end

    it "is 0%" do
      campaign.stub(:donation_total).and_return(0)
      campaign.donation_target = 5000
      campaign.donation_total_complete_percent.should == 0
    end

    it "is 25%" do
      campaign.stub(:donation_total).and_return(4000)
      campaign.donation_target = 16000
      campaign.donation_total_complete_percent.should == 25
    end

    it "is 33%" do
      campaign.stub(:donation_total).and_return(5000)
      campaign.donation_target = 15000
      campaign.donation_total_complete_percent.should == 33
    end

    it "is 50%" do
      campaign.stub(:donation_total).and_return(6000)
      campaign.donation_target = 12000
      campaign.donation_total_complete_percent.should == 50
    end

    it "is 67%" do
      campaign.stub(:donation_total).and_return(14000)
      campaign.donation_target = 21000
      campaign.donation_total_complete_percent.should == 67
    end

    it "is 100%" do
      campaign.stub(:donation_total).and_return(8000)
      campaign.donation_target = 8000
      campaign.donation_total_complete_percent.should == 100
    end

    it "is 100% if donations exceed target" do
      campaign.stub(:donation_total).and_return(9000)
      campaign.donation_target = 7000
      campaign.donation_total_complete_percent.should == 100
    end
  end

  context "#donor_total_complete_percent" do
    let(:campaign) { FactoryGirl.create(:campaign) }

    it "is 0% if donors is nil" do
      campaign.stub(:donors).and_return(nil)
      campaign.donor_total_complete_percent.should == 0
    end

    it "is 0% if donors is empty" do
      campaign.stub(:donors).and_return([])
      campaign.donor_total_complete_percent.should == 0
    end

    context "with one donor" do
      before(:each) do
        FactoryGirl.create(:donor, campaign: campaign)
      end

      it "is 25%" do
        campaign.donation_target = 4
        campaign.donor_total_complete_percent.should == 25
      end

      it "is 33%" do
        campaign.donation_target = 3
        campaign.donor_total_complete_percent.should == 33
      end

      it "is 50%" do
        campaign.donation_target = 2
        campaign.donor_total_complete_percent.should == 50
      end

      it "is 100%" do
        campaign.donation_target = 1
        campaign.donor_total_complete_percent.should == 100
      end
    end

    it "is 67%" do
      FactoryGirl.create_list(:donor, 2, campaign: campaign)
      campaign.donation_target = 3
      campaign.donor_total_complete_percent.should == 67
    end

    it "is 100% if donations exceed target" do
      FactoryGirl.create_list(:donor, 2, campaign: campaign)
      campaign.donation_target = 1
      campaign.donor_total_complete_percent.should == 100
    end
  end

end
