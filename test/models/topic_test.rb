require 'test_helper'

class TopicTest < ActiveSupport::TestCase


  attr_reader :topic, :content
  def setup
    @topic = Topic.create(name: "Enumerables")
    @content1 = Content.create(content: "Reduce is hard", topic_id: topic.id)
    @content2 = Content.create(content: "Each is bad", topic_id: topic.id)
  end

  test "it is valid" do
    assert topic.valid?
  end

  test "it is not valid without a name" do
    topic = Topic.create(name: nil)
    refute topic.valid?
  end

  test "it can have many contents" do
    assert_equal 2, topic.contents.count
    assert_equal "Reduce is hard", topic.contents.first.content
  end
  
end
