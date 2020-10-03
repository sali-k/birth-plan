class BirthsController < ApplicationController
  def index
    @births = Birth.all
  end
end
