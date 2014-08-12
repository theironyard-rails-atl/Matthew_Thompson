require 'httparty'
 


class Repo
  def initialize data
    @data = data
  end

  # METAPROGRAMMING!
  # %w(name url description size created_at updated_at).each do |k|
  #   define_method(k) do
  #     @data[k]
  #   end
  # end

  def name
    @data["name"]
  end

  def url
    @data["html_url"]
  end

  def description
    @data["description"]
  end

  def size
    @data["size"]
  end

  def created_at
    @data["created_at"]
  end

  def updated_at
    @data["updated_at"]
  end
end


class Github
  include HTTParty # brings in `get`, `post`, and others (put, patch)
  base_uri 'https://api.github.com'

  def self.repos_for username
    response = get "/users/#{username}/repos", headers: { "User-Agent" => "app" }
    response.map { |data| Repo.new data }
  end
end
