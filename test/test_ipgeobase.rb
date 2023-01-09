# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < Minitest::Test
  def setup
    stub_request(:get, %r{/ip-api.com/xml/*})
      .with(headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.2'
        })
      .to_return(body: File.read("test/response_mock.xml"))
  end
  
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_it_does_something_useful
    result = Ipgeobase.lookup('202.241.108.153')
    assert(result.country == 'Japan')
  end
end
