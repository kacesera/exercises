require 'socket'
require_relative 'NotesList'

server = TCPServer.new(2345)
socket = server.accept

notes = NotesList.new(socket)

notes.try_load_notes



socket.close