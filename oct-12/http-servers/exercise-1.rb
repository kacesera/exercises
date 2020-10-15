# Exercise 1

# Get this server running:

require 'socket'

def server_start
  server = TCPServer.new(2345)
  
  loop do
    socket = server.accept
    request = get_lines_until_blank(socket)
    puts request

    response = build_http_response("Hello!\n")

    socket.print response
    puts response

    socket.close
  end
end

def build_http_response(response)
  "HTTP/1.1 200 OK\r\n" +
  "Content-Type: text/plain\r\n" +
  "Content-Length: #{response.bytesize}\r\n" +
  "Connection: close\r\n" +
  "\r\n" +
  response
end

def get_lines_until_blank(socket)
  message = ""
  loop do 
    line = socket.gets
    if line.chomp == ""
      break
    else
      message += line
    end
  end
  message
end


server_start

# It just prints what is sent to it.

# In your web browser, visit `http://localhost:2345`.

# Look at what the server prints in the terminal. That's what your web browser is sending to the server.

# Of course, the server isn't sending anything back, so the web browser sits and waits forever.
