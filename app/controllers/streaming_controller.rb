class StreamingController < ApplicationController
  # Taken from http://tenderlovemaking.com/2012/07/30/is-it-live.html
  # Aron Patterson aka tenderlove wrote an article back in the day-
  # introducing pushing data into browsers with rails 
  # it has now become a core feature of rails 4
  require 'reloader/sse'
  include ActionController::Live

  def push
    # setting header content type
    response.headers['Content-Type'] = 'text/event-stream'
    # making object of SSE class, in lib/reloder/sse.rb
    sse = Reloader::SSE.new(response.stream)
    begin
      # we can add any conditional logic here to push data to clients-
      # based on changes in the data underneath, for example we could use redis
      # to subscribe to records of a model and when they change we can notify-
      # all live broswer connections with the change, that way we can push out notifications
      # for example => subscribe to a messages collection and tell users about new messages in real time without any AJAX
      # redis is one solution - YMMV
      loop do
        sse.write({ :time => Time.now })
        sleep 1
      end
    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      # make sure the stream closes
      sse.close
    end
  end

  # this is NOT a live streaming action
  # it returns current time in json against an AJAX call
  # this is to demonstrate AJAX hell
  def index
    respond_to do |format|
      format.hml{} # just render html
      format.json {render :json => {:time => Time.now}}
    end
  end

end
