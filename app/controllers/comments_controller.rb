class CommentsController < ApplicationController

  def create
    @birth = Birth.find(params[:birth_id])
    @user = @birth.user
    @comment = @birth.comments.build(user_id: current_user.id, content: params[:comment][:content])
    if !@birth.nil? && @comment.save
      flash[:success] = "コメントを追加しました！"
    else
      flash[:danger] = "空のコメントは投稿できません。"
    end
    redirect_to request.referrer || root_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    if user_signed_in? && current_user.id == @comment.user_id
      @comment.destroy
      redirect_to item_path(params[:item_id])
    else
      redirect_to item_path(params[:item_id]), alert: :'ログイン済みのコメント投稿者本人のみがコメントを削除できます'
    end
  end
end
