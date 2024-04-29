
minitest_options = {
  test_folders: ['test'],
  # all_after_pass: false,
  # all_after_pass: true,
  # all_on_start: false,
  # all_on_start: true,
  all_env: {
  }
}

guard :minitest, minitest_options do
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^test/test_helper\.rb$}) { 'test' }
  watch(%r{^test/support/(.+)\.rb$}) { 'test' }
  watch(%r{^test/fixtures/(.+)\.yml$}) { 'test' }
  watch(%r{^app/controllers/application_controller\.rb$}) { 'test' }

  watch(%r{^app/(.+)\.rb$}) do |m|
    "test/#{m[1]}_test.rb"
  end

  watch(%r{^lib/(.+)\.rb$}) do |m|
    "test/lib/#{m[1]}_test.rb"
  end

  watch(%r{^lib/tasks/(.+)\.rake$}) do |m|
    "test/lib/tasks/rake_#{m[1]}_test.rb"
  end

  watch(%r{^app/controllers/(.+)_controller\.rb$}) do |m|
    "test/system/#{m[1]}_test.rb"
  end

  watch(%r{^app/views/(.+)_mailer/.+}) do |m|
    "test/mailers/#{m[1]}_mailer_test.rb"
  end

  watch(%r{^app/components/(.+)_component/.+}) do |m|
    "test/components/#{m[1]}_component_test.rb"
  end
end
