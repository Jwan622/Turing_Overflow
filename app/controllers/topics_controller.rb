class TopicsController < ApplicationController

  def index
    @sorted_topics = Topic.all.sort_by { |topic| topic.name }
  end

  def show
    @topic = Topic.find_by(id: params[:id])
  end

  def new
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:name))

    @topic.save
    redirect_to @topic
  end
end
