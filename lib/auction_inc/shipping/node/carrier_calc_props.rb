module AuctionInc
  module Shipping
    class CarrierCalcProps < Node
      xml_accessor :weight
      xml_accessor :weight_u_o_m
      xml_accessor :length
      xml_accessor :width
      xml_accessor :height
      xml_accessor :dim_u_o_m
      xml_accessor :lot_size
      xml_accessor :declared_value
      xml_accessor :pack_method
      xml_accessor :origin_code
    end
  end
end
