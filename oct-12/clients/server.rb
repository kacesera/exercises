require 'socket'

server = TCPServer.new(2345)

socket = server.accept

loop do
  socket.puts "CLIENT WHAT IS YOUR NAME, AGAIN?"
  name = socket.gets.chomp
  socket.puts "OH RIGHT! #{name.upcase}!"
  socket.puts "WHAT'S YOUR FAVORITE COLOR?"
  socket.puts "I'M NOT SHOUTING. YOU'RE SHOUTING"
end

socket.close