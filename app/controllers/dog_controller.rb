class DogController < ApplicationController
  def index; end

  def show
    @dog = Dog.find(params[:id])
  end

  def search
    if (params[:search] != "") && params[:breed_id].to_i != 0
      breed_id = Breed.find(params[:breed_id].to_i).id
      # @dogs = Dog.where("lower(name) LIKE :search",
      #                   search: "%#{params[:search]}%").map do |x|
      #   if x.breed_dogs.index do |y|
      #        y.breed_id == breed_id
      #      end.nil?
      #     return x
      #   end
      # end
      @dogs = Dog.joins(:breed_dogs)
                 .where("lower(name) LIKE :search",
                        search: "%#{params[:search]}%")
                 .where('breed_dogs.breed_id': breed_id)
    elsif (params[:search] != "") && params[:breed_id].to_i == 0
      @dogs = Dog.where("lower(name) LIKE :search",
                        search: "%#{params[:search]}%")
    elsif params[:breed_id].to_i == 0
      @dogs = Dog.all
    else
      @dogs = Breed.find(params[:breed_id]).breed_dogs.map { |x| x.dog }
    end
  end

  def upvote
    dog = Dog.find(params[:id])
    dog.likes += 1
    dog.save
    redirect_back(fallback_location: root_path)
  end
end
