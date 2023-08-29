require_relative "udp_moose"
require "base64"

begin

	socket = UDPMoose.new(6501)
	img64 = Base64.encode64(File.read("big_image.jpg"))

	request_id = socket.send(img64, "10.110.255.255", 6501)

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