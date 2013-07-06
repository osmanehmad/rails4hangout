LiveStreaming::Application.routes.draw do
  match "/live" => "streaming#live", :via => :get #rails 4 likes to explicitly know if a match is via get or post
  match "/ajax" => "ajax#index", :via => :get
end
