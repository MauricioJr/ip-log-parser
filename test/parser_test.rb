require 'test/unit'
require '../lib/parser'
require '../lib/ip'

class ParserTest < Test::Unit::TestCase

    def test_should_read_ip_val
      assert_equal [9, 8, 7], Parser.read_val("1.2.3: 9,8,7"), "reading ip value"
      assert_equal [9, 8, 7], Parser.read_val("1.2: 9, 8, 7"), "reading ip value with spaces"
    end
    
    def test_should_read_ip_adress
      assert_equal "1.2.3.5", Parser.read_address("1.2.3.5: 9,8,7,6"), "reading ip adress"
      assert_equal "1.2.3.5", Parser.read_address("1. 2. 3.  5: 9,8"), "reading ip adress with spaces"
    end    

    def test_should_parse_filesContent_in_array_of_ips
      array_of_ips = Parser.parse(["../logs/ip_logfile_1.txt", "../logs/ip_logfile_2.txt"],[])
      assert_equal true, array_of_ips.kind_of?(Array), "should return an valid array"
      assert_equal true, array_of_ips.select {|ip, r| ip.kind_of?(Ip)}.size > 0, "should contains just Ip objects"                                 
    end  

    def test_should_raise_exception_for_invalid_file
      assert_raises RuntimeError do
        Parser.parse(["../logs/ip_logfile_1.txt", "../logs/ip_log_error.txt"],[])          
      end
    end  
end    