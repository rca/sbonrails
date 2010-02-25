class PresentationsController < ApplicationController

  def index
  end

  def ideas
    @presentations = Presentation.ideas.all
  end

  def past
    @presentations = Presentation.past.all
  end

  def upcoming
    @presentations = Presentation.upcoming.all
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(params[:presentation])
    if @presentation.save
      flash[:success] = "Presentation was saved successfully"
      redirect_to root_url
    else
      flash[:error] = "There was an error saving your presentation"
      render :action => 'new'

    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

end

