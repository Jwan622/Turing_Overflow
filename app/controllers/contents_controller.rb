class ContentsController < ApplicationController

  def index
  end

  def edit
    @content = Content.find(id: params[:id].to_i)
  end

end
