# frozen_string_literal: true

require_relative 'udp_moose'
require 'base64'

begin
  socket = UDPMoose.new(ARGV[0], true)
  socket.receive do |payload|
    puts "received data: #{payload}"
  end
rescue Interrupt
  raise SignalException, 2
end
