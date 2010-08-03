module AuctionInc
  module Shipping
    class DestinationAddress < Node
      xml_accessor :residential_delivery
      xml_accessor :country_code
      xml_accessor :postal_code
      xml_accessor :state_or_province_code
    end
  end
end
