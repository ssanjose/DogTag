class DogController < ApplicationController
  def index; end

  def show
    @dog = Dog.find(params[:id])
  end

  def search; end
end
