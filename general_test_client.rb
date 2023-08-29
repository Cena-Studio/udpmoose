require_relative "udp_moose"
require "base64"

begin

	socket = UDPMoose.new(ARGV[1])
  
  3.times do |i|
    ARGV[i+1] = ARGV[i+1].to_i if ARGV[i+1]
  end
	
  request_id = socket.send("hello world", *ARGV)

	# non block here

	socket.get_responses(request_id) do |responses|

    puts "data transmission failed" if responses.empty?
		responses.each do |server_ip|
			puts "successful transmission to " + server_ip
		end

	end

rescue Interrupt

  raise SignalException.new(2)

end