require "application_system_test_case"

class StaticTest < ApplicationSystemTestCase
  def test_default_syntax
    visit home_index_url
    assert_selector "h1", text: "Static"
  end

  test "default test syntax" do
    visit home_index_url
    assert_selector "h1", text: "Static"
  end

  describe 'minitest-spec syntax' do
    it 'must work with :rack default' do
      visit home_index_url
      assert_selector "h1", text: "Static"
    end

    it 'must work with :cuprite driver with js' do
      with_js
      visit home_index_url
      accept_alert { click_button('Greet') }
    end
  end

  describe 'minitest-given syntax' do
    describe 'must work with default :rack driver' do
      Given { visit home_index_url }
      Then { assert_selector "h1", text: "Static"}
    end

    describe 'must work with js :cuprite driver' do
      Given { with_js }
      Given { visit home_index_url }
      Then { accept_alert { click_button('Greet') } }
    end
  end
end
