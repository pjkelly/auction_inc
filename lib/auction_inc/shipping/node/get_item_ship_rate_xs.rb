module AuctionInc
  module Shipping
    class GetItemShipRateXs < Node
      xml_accessor :version, :from => "@version"
      xml_accessor :detail_level
      xml_accessor :currency
      xml_accessor :carrier_list, :as => [Carrier]
      xml_accessor :origin_address_list, :as => [OriginAddress]
      xml_accessor :destination_address, :as => DestinationAddress
      xml_accessor :item_list, :as => [Item]
    end
  end
end
