class PrototypesController < ApplicationController
  def index
  end
  
  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

end
