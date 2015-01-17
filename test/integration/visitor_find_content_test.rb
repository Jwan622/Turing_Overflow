require 'test_helper'

class VisitorFindContentTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :topic

  def setup
    @topic = Topic.create(name: "Ruby")
    @content = Content.create(content: "Ruby is hard as fuck", topic_id: topic.id)
    @content = Content.create(content: "Ruby is was written by Matz", topic_id: topic.id)
    visit '/'
  end

  test "visitor sees welcome message at welcome path" do
    assert page.has_content?("Welcome to Turing Overflow!")
  end

  test "guest user can reach table of contents" do
    click_link "Enter"
    assert page.has_content?("Table of contents")
  end

  test "guest user can see list of topics" do
    click_link "Enter"
    assert find_link("Ruby").visible?
  end

  test "guest user can see content" do
    click_link "Enter"
    click_link "Ruby"
    assert page.has_content?("built by Matz")
  end

  test "logged in user sees user's ideas" do
    skip
    ApplicationController.any_instance.stubs(:current_user).returns(user) #when you do a current user stub, you actually need a current_user method
    visit user_path(user)
    within("#banner") do
      assert page.has_content?("Welcome, Chris")
    end
  end
end
