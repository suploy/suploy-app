if Rails.env.production?
  redis = Redis.new(url: ENV['REDISTOGO_URL'])
else
  redis = Redis.new
end

Redis.current = Redis::Namespace.new("suploy", redis: redis)
