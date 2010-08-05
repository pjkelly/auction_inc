module AuctionInc
  module Shipping
    class Body < Node
      xml_accessor :get_item_ship_rate_x_s, :as => GetItemShipRateXs
      xml_accessor :item_ship_rate, :as => ItemShipRate
      xml_accessor :error, :as => Error
    end
  end
end
