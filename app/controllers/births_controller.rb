class BirthsController < ApplicationController
  def index
    @births = Birth.all
  end

  def new
    @birth = Birth.new
  end

  def create
    Birth.create(birth_params)
  end

  private
  def birth_params
    params.require(:birth).permit(:user, :plan_name, :description, :hope_id, :attend_id, :contraction, :childbirth, :postpartum, :memo)
  end
end
