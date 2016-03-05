require 'gserver'

class BasicServer < GServer
  def serve(io)
    io.puts("Hello world!")
  end
end

server = BasicServer.new(1234)
server.start
sleep 10
server.shutdown
