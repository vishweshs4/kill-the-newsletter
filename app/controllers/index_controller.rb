class IndexController < ApplicationController
  def index
    @feed = Feed.new
  end
end
