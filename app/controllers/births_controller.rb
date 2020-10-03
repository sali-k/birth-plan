class BirthsController < ApplicationController
  def index
    @births = Birth.all.order("created_at DESC")
  end

  def new
    @birth = Birth.new
  end

  def create
    @birth = Birth.new(birth_params)
    if @birth.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @birth = Birth.find(params[:id])
  end

  private
  def birth_params
    params.require(:birth).permit(:plan_name, :description, :hope_id, :attend_id, :contraction, :childbirth, :postpartum, :memo).merge(user_id: current_user.id)
  end
end
