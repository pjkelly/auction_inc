require 'spec_helper'

describe AuctionInc::Shipping::Error do
  let(:xml_string) { File.read(remote_fixture_file('auction_inc_type_1_error_response.xml')) }
  let(:error) { AuctionInc::Shipping::Envelope.from_xml(xml_string).body.error }

  AuctionInc::Shipping::Error::SEVERITIES.each do |severity|
    describe "##{severity.to_s.downcase}?" do
      it "should return true when severity is #{severity.to_s}" do
        error.send("severity=", severity.to_s)
        error.send("#{severity.to_s.downcase}?").should be_true
      end

      AuctionInc::Shipping::Error::SEVERITIES.reject { |s| s == severity }.each do |other|
        it "should return false when severity is #{other.to_s}" do
          error.send("severity=", other.to_s)
          error.send("#{severity.to_s.downcase}?").should be_false
        end
      end
    end
  end
end
