class Message
  include Mongoid::Document
  include Mongoid::Timestamps # This is not included in mongoid models by default 

  field :body, type: String

end
