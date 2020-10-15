require 'socket'

server = TCPServer.new(2345)

socket = server.accept

socket.puts "What do you say?"

they_said = ""

until they_said.downcase == 'quit'
  they_said = socket.gets.chomp
  socket.puts "You said: #{they_said}."
end

socket.close