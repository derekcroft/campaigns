require 'spec_helper'

describe Donor do
  describe "#donation_amount" do
    let(:donor) { FactoryGirl.create :donor }
    it "is zero if they have no pledges" do
      donor.donation_amount.should == 0
    end

    context "for a fixed pledge" do
      before(:each) do
        donor.pledges.create!(pledge_type: 'fixed', amount: 52.50)

      end

      it { donor.pledges.count.should == 1 }
      it { donor.donation_amount.should == 52.50 }

      context "and then a second fixed pledge of a buck o' five" do
        before(:each) do
          donor.pledges.create(pledge_type: 'fixed', amount: 1.05)
        end

        it { donor.pledges.count.should == 2 }
        it { donor.donation_amount.should == 53.55 }
      end
    end

    context "for a penny pledge" do
      context "with no cap" do
        before(:each) do
          donor.pledges.create(pledge_type: 'penny')
        end

        it "is a penny" do
          donor.donation_amount.should == 0.01
        end

        context "with another donor in a different campaign" do
          before(:each) do
            FactoryGirl.create :donor
          end

          it "does not count toward my penny pledge" do
            donor.donation_amount.should == 0.01
          end
        end

        context "with another donor in the same campaign" do
          let(:other_donor) { FactoryGirl.create :donor, campaign: donor.campaign }

          context "who has not made a pledge" do
            it "should not affect my donation" do
              donor.donation_amount.should == 0.01
            end
          end

          context "who makes one pledge" do
            before(:each) do
              other_donor.pledges.penny.create
            end

            it "should increase my donation by a penny" do
              donor.donation_amount.should == 0.02
            end

            context "then another pledge" do
              before(:each) do
                other_donor.pledges.penny.create
              end

              it "should not increase my donation" do
                donor.donation_amount.should == 0.02
              end
            end
          end
        end

        context "with 4 other donors in the same campaign" do
          before(:each) do
            donors = FactoryGirl.create_list :donor, 4, campaign: donor.campaign
            donors.each { |donor| donor.pledges.penny.create }
          end

          it { donor.donation_amount.should == 0.05 }

          context "and I make an additional fixed donation of a buck o' five" do
            before(:each) do
              donor.pledges.create(pledge_type: 'fixed', amount: 1.05)
            end

            it { donor.pledges.count.should == 2 }
            it { donor.donation_amount.should == 1.10 }
          end
        end
      end

      context "with a cap of three cents" do
        before(:each) do
          # turn off the validations because the minimum cap would require way too many records
          donor.pledges.build(pledge_type: 'penny', cap: 0.03).save(validate: false)
        end

        it { donor.donation_amount.should == 0.01 }

        context "with two other penny pledge donors in the same campaign" do
          before(:each) do
            donors = FactoryGirl.create_list :donor, 2, campaign: donor.campaign
            donors.each { |donor| donor.pledges.penny.create }
          end

          it { donor.donation_amount.should == 0.03 }
        end

        context "with three other penny pledge donors in the same campaign" do
          before(:each) do
            donors = FactoryGirl.create_list :donor, 3, campaign: donor.campaign
            donors.each { |donor| donor.pledges.penny.create }
          end

          it "should still equal the cap of three cents" do
            donor.donation_amount.should == 0.03
          end
        end
      end
    end
  end
end
