class ContentsController < ApplicationController

  def index
  end

  def new
    require 'pry'
    binding.pry
  end

  def edit
    @content = Content.find(params[:id].to_i)
  end


  def create
    @content = topic_params_id.contents.new(content_params)
    @content.save!
    redirect_to @content.topic
  end

  def update
    content_params_id.update_attribute(:resource, content_params[:resource])
    redirect_to topic_path(content_params_id.topic)
  end

  def destroy
    content_params_id.destroy
    flash[:success] = "Resource deleted. It's gone forever."
    redirect_to topic_path(topic_params_id)
  end

  private

  def topic_params_id
    Topic.find(params[:topic_id].to_i)
  end

  def content_params_id
    Content.find(params[:id].to_i)
  end

  def content_params
    params.require(:contents).permit(:resource, :link)
  end

end
