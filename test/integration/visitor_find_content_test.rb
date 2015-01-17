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

  test "unregistered user cannot login" do
    skip
    fill_in "sesh[username]", with: "ChrisXX"
    fill_in "sesh[password]", with: "LaurenXX"
    click_link_or_button "Login"
    within("#errors") do
      assert page.has_content?("You typed in the wrong username/password")
    end
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
