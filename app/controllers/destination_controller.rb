class DestinationController < ApplicationController
  def show
    @destination = Destination.find(params[:id])
  end

end
