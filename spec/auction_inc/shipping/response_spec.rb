require 'spec_helper'

describe AuctionInc::Shipping::Response do
  let(:xml_string) { File.read(remote_fixture_file('auction_inc_get_time_response.xml')) }
  let(:response) { AuctionInc::Shipping::Response.new(xml_string) }

  describe "initialization" do
    it "should pass the xml_string to Body.from_xml" do
      AuctionInc::Shipping::Envelope.should_receive(:from_xml).with(xml_string)
      AuctionInc::Shipping::Response.new(xml_string)
    end

    it "should put the raw XML in #raw" do
      response.raw.should == xml_string
    end

    it "should set #parsed as an Envelope object" do
      response.parsed.should be_a(AuctionInc::Shipping::Envelope)
    end
  end

  describe "#body" do
    it "should be a Body object" do
      response.body.should be_an(AuctionInc::Shipping::Body)
    end
  end

  describe "#has_errors?" do
    [1, 2].each do |type|
      context "when there is a type #{type.to_s} error response" do
        let(:xml_string) { File.read(remote_fixture_file("auction_inc_type_#{type.to_s}_error_response.xml")) }

        it "should return true" do
          response = AuctionInc::Shipping::Response.new(xml_string)
          response.has_errors?.should be_true
        end
      end
    end

    [1, 2, 3].each do |level|
      context "when there is a detail level #{level.to_s} response" do
        let(:xml_string) { File.read(remote_fixture_file("auction_inc_detail_level_#{level.to_s}_response.xml")) }

        it "should return false" do
          response = AuctionInc::Shipping::Response.new(xml_string)
          response.has_errors?.should be_false
        end
      end
    end
  end

  describe "#error" do
    context "when there is a type 1 error response" do
      let(:xml_string) { File.read(remote_fixture_file("auction_inc_type_1_error_response.xml")) }

      it "should include be error inside <Body/>" do
        response = AuctionInc::Shipping::Response.new(xml_string)
        response.error.should == response.body.error
      end
    end

    context "when there is a type 2 error response" do
      let(:xml_string) { File.read(remote_fixture_file("auction_inc_type_2_error_response.xml")) }

      it "should be the first ship_rate error" do
        response = AuctionInc::Shipping::Response.new(xml_string)
        response.error.should == response.body.item_ship_rate.error
      end
    end

    [1, 2, 3].each do |level|
      context "when there is a detail level #{level.to_s} response" do
        let(:xml_string) { File.read(remote_fixture_file("auction_inc_detail_level_#{level.to_s}_response.xml")) }

        it "should be empty" do
          response = AuctionInc::Shipping::Response.new(xml_string)
          response.error.should be_nil
        end
      end
    end
  end
end
