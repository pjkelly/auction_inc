module AuctionInc
  module Shipping
    class Package < Node
      xml_accessor :quantity
      xml_accessor :pack_method
      xml_accessor :carrier_service
      xml_accessor :origin
      xml_accessor :declared_value
      xml_accessor :weight
      xml_accessor :length
      xml_accessor :width
      xml_accessor :height
      xml_accessor :oversize_code
      xml_accessor :flat_rate_code
      xml_accessor :carrier_rate
      xml_accessor :fixed_rate
      xml_accessor :surcharge
      xml_accessor :fuel_surcharge
      xml_accessor :insurance
      xml_accessor :handling
      xml_accessor :ship_rate
      xml_accessor :pkg_item, :as => [PkgItem]
    end
  end
end
