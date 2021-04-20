class RackApplication

  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new
    if req.path.match("hello")
      res.write("<h1>Hello Nerds!</h1>")
    else
      res.write("<h1>PAGE IN PROGRESS</h1>")
    end
    if req.params.keys.any?
      res.write("<h1>Here's your value: #{req.params.values.join(", ")}</h1>")
    end
    res.finish
  end

end
