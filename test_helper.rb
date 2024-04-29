ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/focus'
require 'minitest/given'
require 'minitest/hooks/default'
require 'minitest/rails'
require 'minitest/spec'
require 'mocha/minitest'
require 'capybara/rails'
require 'pry'

Dir[Rails.root.join('test/support/**/*.rb')].each { |f| require f }


class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  include Support::Helpers::AuthenticationsHelper
  include Support::Helpers::EmailHelper
  include Support::Helpers::FileHelper
  include Support::Helpers::PlaybackHelper

  include Support::Matchers::AASMMatchers
  include Support::Matchers::PunditMatchers
  include Support::Matchers::RequestMatchers

  parallelize_setup do |worker|
    ENV["TEST_WORKER_NUMBER"] = worker.to_s
    Capybara.server_port = 8200 + ENV["TEST_WORKER_NUMBER"].to_i
  end

  parallelize_teardown do |worker|
    Capybara.current_driver = :rack_test
  end

  parallelize(workers: :number_of_processors)

  fixtures :all
end
