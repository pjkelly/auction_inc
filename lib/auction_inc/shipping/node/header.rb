module AuctionInc
  module Shipping
    class Header < Node
      xml_accessor :account_id
      xml_accessor :date
    end
  end
end
