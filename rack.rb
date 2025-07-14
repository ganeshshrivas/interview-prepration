Rack aims to provide a minimal API for connecting web servers and web frameworks.

Rails Application's Rack Object
Rails.application is the primary Rack application object of a Rails application. Any Rack compliant web server should be using Rails.application object to serve a Rails application.

2.2. bin/rails server
bin/rails server does the basic job of creating a Rack::Server object and starting the web server.

Here's how bin/rails server creates an instance of Rack::Server

Rails::Server.new.tap do |server|
  require APP_PATH
  Dir.chdir(Rails.application.root)
  server.start
end
Copy
The Rails::Server inherits from Rack::Server and calls the Rack::Server#start method this way:

class Server < ::Rack::Server
  def start
    # ...
    super
  end
end
Copy
