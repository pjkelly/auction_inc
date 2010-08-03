module AuctionInc
  module Shipping
    class PkgItem < Node
      xml_accessor :ref_code
      xml_accessor :qty
      xml_accessor :weight
    end
  end
end
