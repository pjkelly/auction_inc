module AuctionInc
  module Shipping
    class Carrier < Node
      attr_accessor :name
      xml_accessor :code, :from => "@Code"
      xml_accessor :entry_point
      xml_accessor :service_list, :as => [Service]
    end
  end
end
