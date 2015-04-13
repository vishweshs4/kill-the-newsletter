class FeedsController < ApplicationController
  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.create!(feed_params)
  end

  def show
    @feed = Feed.find_by(token: params.fetch(:id))
    if @feed.nil?
      return redirect_to root_url, alert: 'Feed not found!'
    end
    render formats: :atom
  end

  private

  def feed_params
    params.require(:feed).permit(:title)
  end
end
