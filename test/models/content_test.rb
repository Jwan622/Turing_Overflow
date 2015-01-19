require 'test_helper'

class ContentTest < ActiveSupport::TestCase

  attr_reader :content, :topic

  def setup
    @topic = Topic.create(name: "Ruby")
    @content = Content.create(resource: "Ruby is a high level language", topic_id: topic.id)
  end

  def test_content_is_valid
    assert content.valid?
  end

  def test_content_is_invalid
    content.resource = nil
    refute content.valid?
  end

  def test_content_can_refer_to_topic
    assert_equal "Ruby", content.topic.name
  end


end
