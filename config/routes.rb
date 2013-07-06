LiveStreaming::Application.routes.draw do
  root :to => "streaming#push"
  get "streaming/index"
end
