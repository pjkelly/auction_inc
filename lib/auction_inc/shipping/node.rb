module AuctionInc
  module Shipping
    class Node
      include ROXML
      xml_convention :camelcase

      def initialize(options = {})
        options.each do |key, value|
          setter = "#{key.to_s}=".to_sym
          self.send(setter, value) if self.respond_to?(setter)
        end
      end
    end
  end
end
