$:.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'active_support'
require 'roxml'

require 'auction_inc/shipping/node'

# Nodes without dependencies
require 'auction_inc/shipping/node/carrier_calc_props'
require 'auction_inc/shipping/node/destination_address'
require 'auction_inc/shipping/node/error'
require 'auction_inc/shipping/node/header'
require 'auction_inc/shipping/node/origin_address'
require 'auction_inc/shipping/node/pkg_item'
require 'auction_inc/shipping/node/service'

# Nodes with dependencies in order
require 'auction_inc/shipping/node/package'
require 'auction_inc/shipping/node/ship_rate'
require 'auction_inc/shipping/node/calc_method'
require 'auction_inc/shipping/node/item'
require 'auction_inc/shipping/node/carrier'
require 'auction_inc/shipping/node/get_item_ship_rate_xs'
require 'auction_inc/shipping/node/body'
require 'auction_inc/shipping/node/envelope'

require 'auction_inc/shipping/base'
require 'auction_inc/shipping/xs'
