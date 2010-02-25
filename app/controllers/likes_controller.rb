class LikesController < ApplicationController

  def create
    @like = Like.new(params[:like])
    @like.user = current_user

    if @like.save
      respond_to  do |format|
        format.js { render :text => 'success' }
      end

    else
      flash[:error] = "could not save like"

      respond_to do |format|
        format.js { render :text => 'failure' }
      end

    end

  end


end

