# frozen_string_literal: true
require 'application_system_test_case'
require 'capybara/cuprite'

class NavMenuTest < ApplicationSystemTestCase
  test "should search function" do
    visit root_url
    find("#navsearch-content").set("Ruby")
    find("#navsearch-submit").click
    assert_current_path search_path(query: "Ruby")
    assert_selector "h1", text: "Search Result: Ruby"
  end

  test "should ignore empty search" do
    visit root_url
    find("#navsearch-submit").click
    # Nothing should happen
    assert_current_path root_path
  end
end
