module AuctionInc
  module Shipping
    class Carrier < Node
      attr_accessor :name
      xml_accessor :code, :from => "@code"
      xml_accessor :entry_point
      xml_accessor :services, :as => [Service], :in => "ServiceList"
    end
  end
end
