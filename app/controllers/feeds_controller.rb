class FeedsController < ApplicationController
  def show
    @feed = Feed.find_by(token: params.fetch(:id))
    if @feed.nil?
      return redirect_to root_url, alert: 'Feed not found!'
    end
    render formats: :atom
  end
end
