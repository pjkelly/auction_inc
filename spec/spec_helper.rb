$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'auction_inc'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
end

require 'fakeweb'

FakeWeb.allow_net_connect = false

def remote_fixture_file(filename)
  return '' if filename == ''
  File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', filename))
end

# Fake out the call to Auction Inc.
# e.g. http://api.auctioninc.com
# FakeWeb.register_uri(:post, %r|api\.auctioninc\.com/|, :body => remote_fixture_file('auction_inc_get_time_response.xml'))
