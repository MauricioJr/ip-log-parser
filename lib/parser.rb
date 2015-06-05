class Parser 
  require_relative 'ip'

  def self.read_address line
    line.gsub(/\s+/, "").split(":")[0]
  end

  def self.read_val line
      begin 
        line.split(":")[1].split(",").map(&:to_i)
      rescue
        raise "WARNING -line with #{line} must contains an invalid address. Find for malformed input."
      end  
  end  

  def self.parse files, ip_array
    files.each do |file|
      File.open(file, 'r').each_line do |line| 
        unless line.strip.empty?       
          @ip = Ip.new(Parser.read_address(line))
          @ip = ip_array.include?(@ip) ? ip_array.delete(@ip) : @ip
          @ip.merge = Parser.read_val(line.strip)
          ip_array << @ip
        else
          raise "#{file} must contains an full empty line. Find for malformed input."
        end 
      end
    end
    ip_array  
  end
  
  if __FILE__ == $PROGRAM_NAME
    raise 'wrong number of params' unless ARGV.length == 2
    
    @ips = Parser.parse([ARGV[0], ARGV[1]], [])
    File.open("dist/out_ipfile_g#{Time.now.strftime("%H:%M:%S_%Y-%m-%d")}.txt", 'w') do |f| 
     @ips.each {|ip| f.write ip}
    end
    puts @ips
    puts "Done! You also can get the result in the dist/out.txt file." 
  end    
    
end   
