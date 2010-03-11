class HomeController < ApplicationController
  def index
    @presentation_ideas = Presentation.sorted_by_likes_slow(:limit => 5)
    @liked_ideas        = current_user.liked_presentation_ideas if current_user
    @events             = Event.all
  end

end

