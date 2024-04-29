require 'rackup'
require 'rack/handler/puma'

Capybara.register_server :puma_quiet do |app, port, host|
  Rackup::Handler::Puma.run(app, Port: port, Threads: "0:1", Silent: true)
end

Capybara.configure do |c|

  c.server = :puma_quiet
  c.server_host = Socket.ip_address_list.find(&:ipv4_private?)&.ip_address
  c.server_port = 8200
  c.default_max_wait_time = 2
  c.javascript_driver = :cuprite
  c.save_path = 'tmp/screenshots'
end
