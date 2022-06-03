Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://10.0.2.2:8081'
    origins 'http://localhost:19006'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
