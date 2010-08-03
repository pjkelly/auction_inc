module AuctionInc
  module Shipping
    class Envelope < Node
      xml_accessor :header, :as => Header
      xml_accessor :body, :as => Body
    end
  end
end
