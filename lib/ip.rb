class Ip
  attr_reader :address
  attr_accessor :value 

    def initialize address
      if address.empty? 
        raise "informed an invalid ip. Find for malformed input."
      else 
        @address = address
        @value = []
      end  
      
    end

    def address
      @address
    end

    def merge=(val)
      @value = @value|val
    end

    def to_s
      "#{@address}: #{@value.sort.join(",")}\n"
    end

    def ==(other_object)
      @address == other_object.address
    end
end    