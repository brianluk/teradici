require_relative './server'

describe Server do
  it "should reverse the input string" do
    server = Server.new(3000)
    server.reverse_input("test") == "tset"
  end
end
