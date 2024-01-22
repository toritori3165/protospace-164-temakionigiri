class ComentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/prototypes/#{comment.prototyps.id}"  # コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:rototype_id])
  end
end
