require_relative "udp_moose"
require "base64"

begin

  socket = UDPMoose.new(6501, true)
  filename = 0
  socket.receive do |payload|
    filename += 1
    File.open(filename.to_s << ".jpg", "wb") do |file|
      file.write(Base64.decode64(payload))
    end
  end

rescue Interrupt

  raise SignalException.new(2)

end