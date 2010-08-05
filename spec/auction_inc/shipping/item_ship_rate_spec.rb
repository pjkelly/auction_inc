require 'spec_helper'

describe AuctionInc::Shipping::ItemShipRate do
  describe "#has_error?" do
    context "when there are ship_rate errors" do
      let(:xml_string) { File.read(remote_fixture_file('auction_inc_type_2_error_response.xml')) }
      let(:item_ship_rate) { AuctionInc::Shipping::Envelope.from_xml(xml_string).body.item_ship_rate }

      it "should return true" do
        item_ship_rate.has_error?.should be_true
      end
    end

    context "when there are not ship_rate errors" do
      let(:xml_string) { File.read(remote_fixture_file('auction_inc_detail_level_1_response.xml')) }
      let(:item_ship_rate) { AuctionInc::Shipping::Envelope.from_xml(xml_string).body.item_ship_rate }

      it "should return false" do
        item_ship_rate.has_error?.should be_false
      end
    end
  end

  describe "#errors" do
    context "when there are ship_rate errors" do
      let(:xml_string) { File.read(remote_fixture_file('auction_inc_type_2_error_response.xml')) }
      let(:item_ship_rate) { AuctionInc::Shipping::Envelope.from_xml(xml_string).body.item_ship_rate }

      it "should include errors from the ship rates" do
        item_ship_rate.errors.should include(item_ship_rate.ship_rates.first.errors.first)
      end
    end

    context "when there are not ship_rate errors" do
      let(:xml_string) { File.read(remote_fixture_file('auction_inc_detail_level_1_response.xml')) }
      let(:item_ship_rate) { AuctionInc::Shipping::Envelope.from_xml(xml_string).body.item_ship_rate }

      it "should be empty" do
        item_ship_rate.errors.should be_empty
      end
    end
  end

  describe "#error" do
    context "when there are ship_rate errors" do
      let(:xml_string) { File.read(remote_fixture_file('auction_inc_type_2_error_response.xml')) }
      let(:item_ship_rate) { AuctionInc::Shipping::Envelope.from_xml(xml_string).body.item_ship_rate }

      it "should return the first error from the errors array" do
        item_ship_rate.error.should == item_ship_rate.errors.first
      end
    end

    context "when there are not ship_rate errors" do
      let(:xml_string) { File.read(remote_fixture_file('auction_inc_detail_level_1_response.xml')) }
      let(:item_ship_rate) { AuctionInc::Shipping::Envelope.from_xml(xml_string).body.item_ship_rate }

      it "should return nil" do
        item_ship_rate.error.should be_nil
      end
    end
  end
end
