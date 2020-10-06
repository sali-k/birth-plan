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
    @birth = @comment.birth_id
    if user_signed_in? && current_user.id == @comment.user_id
      @comment.destroy
      flash[:success] = "コメントを削除しました"
      redirect_to birth_url(@birth)
    else
      redirect_to birth_url(@birth)
    end
  end
end
