require 'socket'

class Server
  def initialize(port)
    @server_socket = TCPServer.open(port)

    puts 'Server Started'
  end

  def start
    loop {
      Thread.start(@server_socket.accept) do |client|
      input = client.gets
      result = reverse_input(input)
      client.puts result
      client.close
      end
    }
  end

  def reverse_input(input)
    input.reverse!
    input.delete!("\n")
  end

  def stop
    exit
  end
end
