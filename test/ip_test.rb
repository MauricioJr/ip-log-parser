require 'test/unit'
require '../lib/parser'
require '../lib/ip'

class IpTest < Test::Unit::TestCase

  def test_should_merge_ip_values 
    @ip = Ip.new(Parser.read_address("1.2.3.5: 9,8,7,6"))
    @ip.merge = Parser.read_val("1.2.3.5: 9,8,7,6") 
    @ip.merge = Parser.read_val("1.2.3.5: 7,6,2,1")
    assert_equal "1.2.3.5: 1,2,6,7,8,9\n", @ip.to_s, "should merge ips without duplicate values"
  end

end