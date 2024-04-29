module CapybaraHelper

  def take_screenshot
    return super unless Capybara.last_used_session
    Capybara.using_session(Capybara.last_used_session) { super }
  end

  def image_path
    Pathname.new(absolute_image_path).relative_path_from(Rails.root).to_s
  end

  def with_js
    Capybara.current_driver = :cuprite
  end
end
