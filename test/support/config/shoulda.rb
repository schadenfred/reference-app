
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest_5
    with.library :rails
  end
end