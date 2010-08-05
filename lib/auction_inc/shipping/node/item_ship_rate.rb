module AuctionInc
  module Shipping
    class ItemShipRate < Node
      xml_accessor :currency
      xml_accessor :ship_rates, :as => [ShipRate], :in => "ShipRateList"

      def has_error?
        error = false
        self.ship_rates.each do |ship_rate|
          error = true if ship_rate.errors.present?
        end
        error
      end
      alias_method :has_errors?, :has_error?

      def error
        self.errors.empty? ? nil : self.errors.first
      end

      def errors
        @errors = []
        self.ship_rates.each do |ship_rate|
          @errors << ship_rate.errors if ship_rate.errors.present?
        end
        @errors.flatten
      end

    end
  end
end
