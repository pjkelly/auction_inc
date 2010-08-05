module AuctionInc
  module Shipping
    class ShipRate < Node
      # Detail Level 1
      xml_accessor :valid?
      xml_accessor :carrier_code
      xml_accessor :service_code
      xml_accessor :service_name
      xml_accessor :calc_method
      xml_accessor :rate
      xml_accessor :errors, :as => [Error], :in => "ErrorList"
      # Detail Level 2
      xml_accessor :carrier_rate
      xml_accessor :fixed_rate
      xml_accessor :surcharges
      xml_accessor :fuel_surcharges
      xml_accessor :handling_fees
      xml_accessor :declared_value
      xml_accessor :insurance_charges
      xml_accessor :weight
      xml_accessor :package_count
      xml_accessor :flat_rate_code
      # Detail Level 3
      xml_accessor :packages, :as => [Package], :in => "PackageDetail"
    end
  end
end
