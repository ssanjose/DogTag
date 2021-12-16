class MainController < ApplicationController
  def index
    @dogs = Dog.all.order("likes DESC").page(params[:page])
    render "dog/index" and return
  end

  def about; end
end
