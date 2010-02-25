class HomeController < ApplicationController
  def index
    @presentation_ideas = Presentation.popular(:limit => 5)
    @liked_ideas        = current_user.liked_presentation_ideas if current_user
  end

end

