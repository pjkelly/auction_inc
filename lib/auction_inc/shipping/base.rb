module AuctionInc
  module Shipping
    class LicenseError < StandardError; end
    class ConfigurationError < StandardError; end
    class ConnectionError < StandardError; end
    class RequestError < StandardError; end
    class ResponseError < StandardError; end

    class Base
      cattr_accessor :license_key, :base_url, :base_path, :carriers_yml, :api_version, :detail_level, :currency, :weight_unit, :dimension_unit

      self.license_key = nil
      self.base_url = 'api.auctioninc.com'
      self.base_path = '/websvc/shire'
      self.carriers_yml = File.join(File.dirname(__FILE__), 'carriers.yml')
      self.api_version = '2.1'
      self.detail_level = 1
      self.currency = :usd
      self.weight_unit = :lbs
      self.dimension_unit = :in

      attr_accessor :response

      def self.carriers
        @carriers ||= load_carriers
      end

      def self.load_carriers
        carrier_data = YAML::load(Pathname.new(carriers_yml).read)
        result = []
        carrier_data.each do |carrier|
          # TODO allow for PkgMaxWeight and OnDemand values
          services = carrier['services'].collect { |s| Service.new(:name => s['name'], :code => s['code'], :klass => s['klass']) }
          result << Carrier.new(:name => carrier['name'], :code => carrier['code'], :entry_point => carrier['entry_point'], :services => services)
        end
        result
      end

      def self.entry_points
        self.carriers.collect { |carrier| carrier.entry_point }
      end

      def self.services
        self.carriers.collect { |carrier| carrier.services }.flatten
      end

      def parsed_response
        self.response
      end

      def make_request
        if license_key.nil?
          raise AuctionInc::Shipping::LicenseError.new("License Key is missing")
        end

        uri = URI.parse(base_url)

        begin
          http_server = Net::HTTP.new(base_url, 80)
          http_request = Net::HTTP::Post.new(base_path)
          http_request.body = self.request_xml

          response_string =  http_server.start { |http| http.request(http_request) }.body
          self.response = Response.new(response_string)
        rescue EOFError => e
          raise ConnectionError, "The remote server dropped the connection"
        rescue Errno::ECONNRESET => e
          raise ConnectionError, "The remote server reset the connection"
        rescue Errno::ECONNREFUSED => e
          raise ConnectionError, "The remote server refused the connection"
        rescue Timeout::Error, Errno::ETIMEDOUT => e
          raise ConnectionError, "The connection to the remote server timed out"
        end
      end

      def request_xml
        <<-HERE
<?xml version="1.0 encoding=iso-8859-1" utf-8 ?>
<Envelope>
 <Header>
    <AccountId>#{license_key}</AccountId>
 </Header>
 <Body>
    <GetTime version="2.0">
    </GetTime>
 </Body>
</Envelope>
        HERE
      end

      def valid_response?
        !self.response.blank?
      end

      def weight_unit
        AuctionInc::Shipping::Base.weight_unit.to_s.upcase
      end

      def dimension_unit
        AuctionInc::Shipping::Base.dimension_unit.to_s.upcase
      end

      def currency
        AuctionInc::Shipping::Base.currency.to_s.upcase
      end
    end
  end
end