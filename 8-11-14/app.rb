require 'sinatra'

get '/' do
  haml :home
end

post '/' do
  @count = {:t => 1, :r => 1, :y => 1}
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
