module AuctionInc
  module Shipping
    class Item < Node
      xml_accessor :ref_code
      xml_accessor :quantity
      xml_accessor :calc_method, :as => CalcMethod
    end
  end
end
