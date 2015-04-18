class FeedsController < ApplicationController
  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new feed_params
    if ! @feed.save
      render :new
    end
  end

  def show
    @feed = Feed.find_by(token: params.fetch(:id))
    if @feed.present?
      render formats: :atom
    else
      new
      flash.now.alert = 'Feed not found! Create one right away on the form below.'
      render :new
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:title)
  end
end
