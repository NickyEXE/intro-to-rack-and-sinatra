# Intro to Sinatra

[Slides](https://docs.google.com/presentation/d/1tUsxHsJr_inMiBLKr4YMKbv4-HzsI3axorXTPta6Yfs/edit?usp=sharing)

## Rack

Rack is a "middleware" gem that every major Ruby server library is based on.

When run, it sets your computer up to take in requests and send back responses.

Its basic formulation involves creating a `config.ru` file in the root directory.

Within the config.ru directory, call `run` passing in something that responds to a `call` method.

```ruby
  #config.ru
  require_relative "environment.rb"
  run RackApp
```

```ruby
  #./rack_app.rb
  class RackApp

  def self.call(env)
    # some stuff that responds to http
  end

end
```

Once this is setup, you can run a server on localhost:9292 with `rackup`, assuming the rack gem is installed.

### Setting up your call method:

Rack provides two useful modules:
`Rack::Request.new(env)` => Parses the argument that's passed into call as a ruby instance with helpful methods, such as `#path` and `#params`.
`Rack::Response.new` => Is how you structure your response, calling `#write` to structure your body, and `#finish` when you're done.

### Sample call method:

```ruby
    def self.call(env)
    req = Rack::Request.new(req)
    res = Rack::Response.new
    # Checks to see if the URL has "hello" in it, otherwise renders "WORK IN PROGRESS"
    if (req.path.match("hello"))
      res.write "<h1>hello</h1>"
    else
      res.write "<h1>WORK IN PROGRESS</h1>"
    end
    res.finish
  end
```

### Updating your code

You can run your rack application on localhost:9292 with `rackup`, but if you update your code, you have to kill your server with `ctrl + c` and restart it.

The "shotgun" gem gives you another command that operates the same way as rackup, but opens a port on `localhost:9393` by default instead. It will update how the server responds every time you save your code, rather than after you reset your server.

# Sinatra

Building an entire application that responds to many different requests in rack is a mess. Sinatra provides a lightweight framework that organizes your code for you.

Rather than learn it here, go to the [readme](http://sinatrarb.com/intro.html)
