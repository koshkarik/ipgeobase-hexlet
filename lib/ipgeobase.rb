# frozen_string_literal: true

require_relative "ipgeobase/version"
require "faraday"
require "happymapper"

module Ipgeobase
  class Error < StandardError; end
  
  def self.lookup(ip)
    response = Faraday.get("http://ip-api.com/xml/#{ip}")
    HappyMapper.parse(response.body)
  end
end
