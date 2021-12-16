class MainController < ApplicationController
  def index
    @dogs = Dog.all
    render "dog/index" and return
  end

  def about; end
end
