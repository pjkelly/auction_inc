module AuctionInc
  module Shipping
    class Error < Node
      xml_accessor :code
      xml_accessor :message
      xml_accessor :detail, :as => []
      xml_accessor :severity

      SEVERITIES = [:NOTICE, :WARNING, :CRITICAL]

      def notice?
        self.severity.to_sym == :NOTICE
      end

      def warning?
        self.severity.to_sym == :WARNING
      end

      def critical?
        self.severity.to_sym == :CRITICAL
      end
    end
  end
end
