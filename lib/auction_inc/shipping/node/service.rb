module AuctionInc
  module Shipping
    class Service < Node
      attr_accessor :name, :klass

      xml_accessor :code, :from => "@code"
      xml_accessor :pkg_max_weight
      xml_accessor :on_demand
    end
  end
end
