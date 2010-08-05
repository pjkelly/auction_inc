module AuctionInc
  module Shipping
    class ItemShipRate < Node
      xml_accessor :currency
      xml_accessor :ship_rates, :as => [ShipRate], :in => "ShipRateList"
    end
  end
end
