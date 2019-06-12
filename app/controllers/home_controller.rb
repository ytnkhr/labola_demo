class HomeController < ApplicationController
  def top
    @sports = Sport.all
  end
end
