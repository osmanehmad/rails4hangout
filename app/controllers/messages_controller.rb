class MessagesController < ApplicationController

  def index
    respond_to do |format|
      format.json { render :json => Message.all.to_a}
      format.html {} #for rendering html 
    end
  end

  def create
    @message = Message.new :body => params["body"]
    respond_to do |format|
      format.json do 
        if @message.save!
          render :json => "200"
        end
      end
    end
  end


  private
  def allowed
    params.allow
  end
end
