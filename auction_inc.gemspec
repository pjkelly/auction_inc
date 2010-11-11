# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{auction_inc}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["pjkelly"]
  s.date = %q{2010-11-10}
  s.description = %q{Ruby wrapper around Auction Inc's shipping API.}
  s.email = %q{pj@crushlovely.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "auction_inc.gemspec",
     "lib/auction_inc.rb",
     "lib/auction_inc/shipping/base.rb",
     "lib/auction_inc/shipping/carriers.yml",
     "lib/auction_inc/shipping/node.rb",
     "lib/auction_inc/shipping/node/body.rb",
     "lib/auction_inc/shipping/node/calc_method.rb",
     "lib/auction_inc/shipping/node/carrier.rb",
     "lib/auction_inc/shipping/node/carrier_calc_props.rb",
     "lib/auction_inc/shipping/node/destination_address.rb",
     "lib/auction_inc/shipping/node/envelope.rb",
     "lib/auction_inc/shipping/node/error.rb",
     "lib/auction_inc/shipping/node/get_item_ship_rate_xs.rb",
     "lib/auction_inc/shipping/node/header.rb",
     "lib/auction_inc/shipping/node/item.rb",
     "lib/auction_inc/shipping/node/item_ship_rate.rb",
     "lib/auction_inc/shipping/node/origin_address.rb",
     "lib/auction_inc/shipping/node/package.rb",
     "lib/auction_inc/shipping/node/pkg_item.rb",
     "lib/auction_inc/shipping/node/service.rb",
     "lib/auction_inc/shipping/node/ship_rate.rb",
     "lib/auction_inc/shipping/response.rb",
     "lib/auction_inc/shipping/xs.rb",
     "spec/auction_inc/shipping/base_spec.rb",
     "spec/auction_inc/shipping/error_spec.rb",
     "spec/auction_inc/shipping/item_ship_rate_spec.rb",
     "spec/auction_inc/shipping/response_spec.rb",
     "spec/fixtures/auction_inc_detail_level_1_response.xml",
     "spec/fixtures/auction_inc_detail_level_2_response.xml",
     "spec/fixtures/auction_inc_detail_level_3_response.xml",
     "spec/fixtures/auction_inc_get_time_response.xml",
     "spec/fixtures/auction_inc_type_1_error_response.xml",
     "spec/fixtures/auction_inc_type_2_error_response.xml",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/pjkelly/auction_inc}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby wrapper around Auction Inc's shipping API.}
  s.test_files = [
    "spec/auction_inc/shipping/base_spec.rb",
     "spec/auction_inc/shipping/error_spec.rb",
     "spec/auction_inc/shipping/item_ship_rate_spec.rb",
     "spec/auction_inc/shipping/response_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<roxml>, ["= 3.1.5"])
      s.add_development_dependency(%q<rspec>, ["= 1.2.9"])
      s.add_development_dependency(%q<fakeweb>, ["= 1.2.8"])
    else
      s.add_dependency(%q<roxml>, ["= 3.1.5"])
      s.add_dependency(%q<rspec>, ["= 1.2.9"])
      s.add_dependency(%q<fakeweb>, ["= 1.2.8"])
    end
  else
    s.add_dependency(%q<roxml>, ["= 3.1.5"])
    s.add_dependency(%q<rspec>, ["= 1.2.9"])
    s.add_dependency(%q<fakeweb>, ["= 1.2.8"])
  end
end

