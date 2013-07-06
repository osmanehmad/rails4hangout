class StrongController < ApplicationController
  def update
    p params
    respond_to do |format|
      format.json{render :json => "200"}
    end
  end
end
