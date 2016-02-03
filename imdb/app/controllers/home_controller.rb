class HomeController < ApplicationController

  def index
  end

  def actor
    @actor = "seven 8 nine"

    render :json => { :actor => "James",
                      :actor2 => "varman"}

  end
end
