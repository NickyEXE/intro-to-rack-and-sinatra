class RackApplication

  def self.call(env)
    # http://localhost:9393/hello?batman=cheese&robin=gouda,%20specifically
    request = Rack::Request.new(env)
    # request.path == "/hello"
    # request.params == {"batman"=>"cheese", "robin"=>"gouda, specifically"}
    response = Rack::Response.new
    if request.path.match("/hello")
      response.write("<h1>HELLO NERDS</h1>")
      response.write("<h2>Hi</h2>")
    else
      response.write("<h1>WORK IN PROGRESS</h1>")
    end
    response.write("<p>I'm here regardless</p>")
    response.status = 302
    response.finish
  end

end
