require 'test_helper'

class TopicTest < ActiveSupport::TestCase

  test "it is valid" do
    topic = Topic.create(name: "Enumerables")
    assert topic.valid?
  end

  test "it is not valid without a name" do
    topic = Topic.create(name: nil)
    refute topic.valid?
  end
end
