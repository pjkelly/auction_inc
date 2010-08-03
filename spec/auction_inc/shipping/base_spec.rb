require 'spec_helper'

describe AuctionInc::Shipping::Base do

  before(:each) do
    AuctionInc::Shipping::Base.license_key = nil
  end

  it "@@base_url should be api.auctioninc.com by default" do
    AuctionInc::Shipping::Base.base_url.should == 'api.auctioninc.com'
  end

  it "@@base_path should be /websvc/shire by default" do
    AuctionInc::Shipping::Base.base_path.should == '/websvc/shire'
  end

  it "@@api_version should be 2.1 by default" do
    AuctionInc::Shipping::Base.api_version.should == '2.1'
  end

  it "@@detail_level should be 1 by default" do
    AuctionInc::Shipping::Base.detail_level.should == 1
  end

  it "@@currency should be :usd by default" do
    AuctionInc::Shipping::Base.currency.should == :usd
  end

  it "@@weight_unit should be :lbs by default" do
    AuctionInc::Shipping::Base.weight_unit.should == :lbs
  end

  it "@@dimension_unit should be :in by default" do
    AuctionInc::Shipping::Base.dimension_unit.should == :in
  end

  it "should have no license_key initially" do
    AuctionInc::Shipping::Base.license_key.should == nil
  end

  describe ".carriers" do
    it "should return an array of carriers" do
      AuctionInc::Shipping::Base.carriers.each { |carrier| carrier.should be_an(AuctionInc::Shipping::Carrier) }
    end
  end

  describe ".entry_points" do
    it "should return an array of all entry points" do
      AuctionInc::Shipping::Base.entry_points.should == AuctionInc::Shipping::Base.carriers.collect { |c| c.entry_point }
    end
  end

  describe ".services" do
    it "should return an array of all services" do
      AuctionInc::Shipping::Base.services.should == AuctionInc::Shipping::Base.carriers.collect { |carrier| carrier.service_list }.flatten
    end
  end

  describe "#make_request" do
    context "when no license key is present" do
      it "should raise a license error" do
        lambda {
          AuctionInc::Shipping::Base.new.make_request
        }.should raise_error(AuctionInc::Shipping::LicenseError)
      end
    end

    context "when a license key is present" do
      it "return set the response" do
        AuctionInc::Shipping::Base.license_key = '123'
        service = AuctionInc::Shipping::Base.new
        service.make_request
        service.response.should_not be_blank
      end
    end
  end
end
