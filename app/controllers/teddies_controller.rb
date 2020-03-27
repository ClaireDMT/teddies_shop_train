class TeddiesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @teddies = Teddy.all
  end

  def show
    @teddy = Teddy.find(params[:id])
  end

  def potential_matches
    @teddy = Teddy.find(params[:id])
    @potential_matches = Teddy.where.not(id: @teddy.id).where(category: @teddy.category).where.not(id:@teddy.find_voted_items)
    raise
  end

  def like
      # see like
      @teddy_matched = Teddy.find(params[:teddy_id])
      @teddy_matching = Teddy.find(params[:teddy_matching])
      @teddy_matched.liked_by(@teddy_matching)
      @teddy_matched.save

      @is_match = false
      # Match ? / Si la personne likee a elle aussi like
      if @teddy_matched.liked? @teddy_matching
        @match = Match.new
        @match.item_1 = @teddy_matched
        @match.item_2 = @teddy_matching
        @match.save
        @is_match = true
      end

      redirect_to potential_matches_teddy_path(@teddy_matching)
    end

    def dislike
      # see dislike
      @user = User.find(params[:user_id])
      @user.disliked_by(current_user)
      @user.save
      redirect_to random_path
    end
end
