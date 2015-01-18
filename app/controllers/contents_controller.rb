class ContentsController < ApplicationController

  def index
  end

  def new
  end

  def edit
    @content = Content.find(id: params[:id].to_i)
  end


  def create
    @content = topic.contents.new(content_params)
    @content.save!
    redirect_to @content.topic
  end

  private

  def topic
    Topic.find(params[:topic_id])
  end

  def content_params
    params.require(:content).permit(:content)
  end

end
