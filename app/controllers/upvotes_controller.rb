class UpvotesController < ApplicationController
	
	respond_to :js

  def create
    @app = App.find(params[:app_id])
    @app.upvote_by current_user
    respond_to do |format|
      format.js {
        render json: {votes: @app.votes_for.size }, status: 200
      }
    end
  end

end