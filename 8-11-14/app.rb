require 'sinatra'
require 'haml'
require 'pry'

require './lib/github.rb'

get '/' do
  haml :index
end


get '/count' do
  @title = "Counter"
  haml :count
end

post '/count' do
  @title = "Counter"
  @count = {}
  @input = params[:counter]
  @input_split = @input.downcase.split("")
  @input_split.each do |char|
    if @count[char]
      @count[char] += 1
    else
      @count[char] = 1
    end
  end
  haml :count
end

get '/github' do
  haml :repo
end

post '/github' do
  @username = params[:search]
  @repos = Github.repos_for(@username)
  #binding.pry
  haml :repo
end
