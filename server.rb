require "sinatra"

get "/" do
  File.read('public/hello.txt')
end

get "/sinatra" do
  "Hello Sinatra"
end