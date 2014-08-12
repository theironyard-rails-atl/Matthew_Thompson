require 'sinatra'


get '/' do
  haml :home
end

post '/' do
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
  haml :home
end

get '/github_repo' do
  haml :repo
end

post '/github_repo' do

  haml :repo
end
