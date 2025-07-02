To restrict users from calling an API more than 4 times within a certain time frame (like per minute or per second), you can implement rate limiting.


Common Approaches:
Use Rack::Attack (Rails)

Use Redis for custom tracking

Use API Gateway (if on AWS, Azure, etc.)

Use Nginx rate limiting

Example 1: Using Rack::Attack in Rails (Recommended)
Step 1: Add to Gemfile

gem 'rack-attack'

Step 2: Configure Rack::Attack
In config/initializers/rack_attack.rb:

class Rack::Attack
  # Allow 4 requests per minute per IP
  throttle('req/ip', limit: 4, period: 60.seconds) do |req|
    req.ip
  end

  # Custom response for throttled requests
  self.throttled_response = lambda do |_env|
    [429, { 'Content-Type' => 'application/json' }, [{ error: 'Rate limit exceeded. Try again later.' }.to_json]]
  end


Step 3: Enable Middleware

Rails automatically includes Rack::Attack if the gem is installed.
You can explicitly add it to your middleware stack if needed.

=============================================================
Example 2: Using Redis for Custom Rate Limiting


def rate_limited?(user_id)
  key = "user:#{user_id}:requests"
  count = Redis.current.get(key).to_i

  if count >= 4
    return true
  else
    Redis.current.multi do
      Redis.current.incr(key)
      Redis.current.expire(key, 60) # expire after 60 seconds
    end
    return false
  end
end


In your controller:

if rate_limited?(current_user.id)
  render json: { error: 'Rate limit exceeded' }, status: :too_many_requests
else
  # Proceed with the API logic
end


Example 3: Using Nginx (If using Nginx as a reverse proxy)
limit_req_zone $binary_remote_addr zone=mylimit:10m rate=4r/m;

server {
  location /api/ {
    limit_req zone=mylimit burst=1 nodelay;
    proxy_pass http://your_app_backend;
  }
}

Example 4: AWS API Gateway (If you use it)
Go to Usage Plans > Throttling settings

Set Rate to 4 requests per second or per minute.

Set Burst to 0 or 1 as needed.