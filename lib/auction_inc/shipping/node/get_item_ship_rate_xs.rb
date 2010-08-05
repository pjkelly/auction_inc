module AuctionInc
  module Shipping
    class GetItemShipRateXs < Node
      xml_accessor :version, :from => "@version"
      xml_accessor :detail_level
      xml_accessor :currency
      xml_accessor :carriers, :as => [Carrier], :in => "CarrierList"
      xml_accessor :origin_addresses, :as => [OriginAddress], :in => "OriginAddressList"
      xml_accessor :destination_address, :as => DestinationAddress
      xml_accessor :items, :as => [Item], :in => "ItemList"
    end
  end
end
