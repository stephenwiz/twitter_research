class SearchesController < ApplicationController


  def index


  end

  def show
    srch = SimpleTwitter::Search.new
   @results =  srch.search(params[:q])

  end

end
