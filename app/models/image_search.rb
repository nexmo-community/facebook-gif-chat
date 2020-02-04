require 'net/http'
require 'json'
class ImageSearch < ApplicationRecord
  def self.search(term)
    url = "https://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{term}&limit=1&offset=0&rating=G&lang=en"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)

    result["data"][0]["images"]["original"]["url"]
  end
end
