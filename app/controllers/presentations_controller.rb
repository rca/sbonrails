class PresentationsController < ApplicationController

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

