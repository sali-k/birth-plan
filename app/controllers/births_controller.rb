class BirthsController < ApplicationController
  def index
    @births = Birth.all.order('created_at DESC')
  end

  def new
    @birth = Birth.new
  end

  def create
    @birth = Birth.new(birth_params)
    if @birth.save
      flash[:success] = 'Myバースプランが登録されました！'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @birth = Birth.find(params[:id])
    @comment = Comment.new
    #@comments = @birth.comments.order(created_at: :asc)
  end

  def edit
    @birth = Birth.find(params[:id])
  end

  def update
    @birth = Birth.find(params[:id])
    if @birth.update_attributes(birth_params)
      flash[:success] = 'Myバースプランが更新されました！'
      redirect_to @birth
    else
      render 'edit'
    end
  end

  def destroy
    @birth = Birth.find(params[:id])
    if user_signed_in? && current_user.id == @birth.user.id
      if @birth.destroy
        flash[:success] = 'Myバースプランが削除されました'
        redirect_to root_path
      else
        render :show
      end
    end
  end

  private

  def birth_params
    params.require(:birth).permit(:plan_name, :thought, :hope_id, :attend_id, :contraction, :breastfeeding_id, :childbirth, :postpartum, :memo).merge(user_id: current_user.id)
  end
end
