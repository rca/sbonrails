class LikesController < ApplicationController


  def new
    # Messy but hack to make for when js is disabled in browser
    params[:like] = {:presentation_id => params[:id] }
    create
  end

  def create
    @like = Like.new(params[:like])
    @like.user = current_user

    if @like.save
      respond_to  do |format|
        format.js { render :text => 'success' }
        format.html {
          flash[:success] = "Your liking of this presentation has been recorded"
          redirect_to root_url
        }
      end

    else
      flash[:error] = "could not save like"

      respond_to do |format|
        format.js { render :text => 'failure' }
        format.html {
          flash[:error] = "Your liking of this presentation could not be recorded"
          redirect_to root_url
        }
      end

    end

  end


end

