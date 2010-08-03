module AuctionInc
  module Shipping
    class Xs < Base
      attr_accessor :origin_addresses, :destination_address, :items

      def request_xml
        doc = Nokogiri::XML::Document.new
        doc.root = self.envelope.to_xml
        doc
      end

      def envelope
        Envelope.new(:header => self.header, :body => self.body)
      end

      def header
        Header.new(:account_id => self.class.license_key)
      end

      def body
        Body.new(:get_item_ship_rate_x_s => self.content)
      end

      def content
        content = GetItemShipRateXs.new
        content.version = self.class.api_version
        content.detail_level = self.class.detail_level
        content.currency = self.currency
        content.carrier_list = self.class.carriers
        content.origin_address_list = origin_addresses unless origin_addresses.blank?
        content.destination_address = destination_address unless destination_address.blank?
        content.item_list = items unless items.blank?
        content
      end
    end
  end
end