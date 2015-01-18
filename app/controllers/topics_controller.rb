class TopicsController < ApplicationController

  def index
    @sorted_topics = Topic.all.sort_by { |topic| topic.name }
  end

  def show
    @topic = Topic.find_by(id: params[:id])
  end
end
