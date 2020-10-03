class BirthsController < ApplicationController
  def index
    @births = Birth.all
  end

  def new
    @birth = Birth.new
  end

end
