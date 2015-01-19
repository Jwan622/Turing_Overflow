class ContentsController < ApplicationController

  def index
  end

  def new
  end

  def edit
    @content = Content.find(params[:id].to_i)
  end


  def create
    require 'pry' ; binding.pry
    @content = topic.contents.new(content_params)
    @content.save!
    redirect_to @content.topic
  end

  def update
    @content = Content.find(params[:id])
    @content.update_attribute(:resource, content_params[:resource])
    redirect_to topic_path(@content.topic)
  end

  private

  def topic
    Topic.find(params[:topic_id])
  end

  def content_params
    params.require(:contents).permit(:resource)
  end

end
