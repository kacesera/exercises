require 'socket'

socket = TCPSocket.new('localhost', 2345)

loop do
  puts socket.gets
  puts "Wow what a rude server... I'm going to say Sarah"
  socket.puts "Sarah"
  puts socket.gets
  puts "Yes, Sarah..."
  puts socket.gets
  puts "Could you please stop shouting?"
  puts socket.gets
end

socket.close