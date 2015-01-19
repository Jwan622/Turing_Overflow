require 'test_helper'

class VisitorFindContentTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :topic, :content

  def setup
    @topic = Topic.create(name: "Ruby")
    @content = Content.create(resource: "Ruby is hard as fuck", topic_id: topic.id)
    @content = Content.create(resource: "Ruby is was written by Matz", topic_id: topic.id)
    visit '/'
  end

  test "visitor sees welcome message at welcome path" do
    assert page.has_content?("Welcome to Turing Overflow!")
  end

  test "visitor can reach table of contents" do
    click_link "Enter"
    assert page.has_content?("Table of contents")
  end

  test "visitor can see list of topics" do
    click_link "Enter"
    assert find_link("Ruby").visible?
  end

  test "visitor can see content" do
    click_link "Enter"
    click_link "Ruby"
    assert page.has_content?("Ruby is hard as fuck")
  end

  test "visitor can return back to topics page from content page" do
    click_link "Enter"
    click_link "Ruby"
    click_link "Return back to Programming Topics"
    assert page.has_content?("Table of contents")
  end

  test "there is an edit link on the show page" do
    click_link "Enter"
    click_link "Ruby"
    within("#content_#{content.id}") do
      assert find_link("Edit")
    end
  end

  test "there is a delete link on the show page" do
    click_link "Enter"
    click_link "Ruby"

  end

  test "we can edit content" do
    skip
    click_link "Enter"
    click_link "Ruby"
    fill_in "contents[resource]", with: "CRUDZZ"
    click_link_or_button "Submit Edits"
    assert page.has_content?("Add new resource to topic")
  end
end
