module AuctionInc
  module Shipping
    class Error < Node
      xml_accessor :code
      xml_accessor :message
      xml_accessor :detail, :as => []
      xml_accessor :severity
    end
  end
end
