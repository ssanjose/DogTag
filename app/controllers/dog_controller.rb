class DogController < ApplicationController
  def index; end

  def show
    @dog = Dog.find(params[:id])
  end

  def search; end

  def upvote
    dog = Dog.find(params[:id])
    dog.likes += 1
    dog.save
    redirect_back(fallback_location: root_path)
  end
end
