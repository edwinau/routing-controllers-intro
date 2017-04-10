class PagesController < ApplicationController

  before_action :set_kitten_url, only: [:kitten, :kittens]


  def welcome
    @header = "This is the Welcome Page"

  end

  def about
    @header = "JUST!"
    render :about

  end

  def contest
    render :contest
  end

  def kitten
  end

  def kittens
  end

  def set_kitten_url
    requested_size = params[:size]
    @kitten_url = "http://lorempixel.com/#{requested_size}/#{requested_size}/cats"
  end

  def contest
    flash[:notice] = "Sorry, the contest has ended"
    redirect_to "/welcome"
  end

  def secrets
    if params[:magic_word] != "abcdef"
      flash[:alert] = "Sorry, you're not authorized to see that page!"
      redirect_to "/bad_password"
    end
  end

end
