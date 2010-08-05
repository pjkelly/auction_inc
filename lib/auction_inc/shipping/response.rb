module AuctionInc
  module Shipping
    class Response
      attr_accessor :raw, :parsed

      def initialize(xml_string)
        self.raw =  xml_string
        self.parsed = Envelope.from_xml(self.raw)
      end

      def body
        self.parsed.body
      end

      def has_error?
        self.body.error.present? || (self.body.item_ship_rate.present? && self.body.item_ship_rate.has_errors?)
      end
      alias_method :has_errors?, :has_error?

      def error
        if self.body.error.present?
          self.body.error 
        elsif self.body.item_ship_rate.present? && self.body.item_ship_rate.has_errors?
          self.body.item_ship_rate.error
        else
          nil
        end
      end

      def ship_rates
        self.parsed.body.item_ship_rate.ship_rates if self.body.item_ship_rate.present?
      end
    end
  end
end