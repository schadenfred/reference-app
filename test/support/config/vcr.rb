
VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'test/playbacks'
  config.default_cassette_options = {
    :match_requests_on => [:method, :host, :path]
  }
  config.hook_into :webmock
end