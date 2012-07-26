class SearchesController < ApplicationController


  def index


  end

  def show
  #  debugger
    srch = SimpleTwitter::Search.new
    srch.results_per_page = params[:rpp]
    @results =  srch.search(params[:q])


  end

end
