class MainController < ApplicationController
  def index
    @dogs = Dog.all.order("likes").page(params[:page])
    render "dog/index" and return
  end

  def about; end
end
