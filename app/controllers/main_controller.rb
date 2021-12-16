class MainController < ApplicationController
  def index
    render "dog/index" and return
  end

  def about; end
end
