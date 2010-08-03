module AuctionInc
  module Shipping
    class OriginAddress < Node
      xml_accessor :origin_code
      xml_accessor :country_code
      xml_accessor :postal_code
      xml_accessor :state_or_province_code
    end
  end
end
