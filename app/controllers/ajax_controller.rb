class AjaxController < ApplicationController
  def index
  # this is NOT a live streaming action
  # it returns current time in json against an AJAX call
  # this is to demonstrate AJAX hell
    respond_to do |format|
      format.html{} # just render html
      format.json {render :json => {:time => Time.now}}
    end
  end
end
