module AuctionInc
  module Shipping
    class CalcMethod < Node
      xml_accessor :code, :from => "@Code"
      xml_accessor :carrier_calc_props, :as => CarrierCalcProps
    end
  end
end
