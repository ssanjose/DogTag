class BreedController < ApplicationController
  def index
    @breeds = Breed.all.page(params[:page])
  end

  def show
    @breed = Breed.find(params[:id])
    @dogs = @breed.breed_dogs.map { |x| x.dog }
    @dogs = Kaminari.paginate_array(@dogs).page(params[:page])
  end
end
