class SearchController < ApplicationController

  def index
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    reply = @conn.get("stores((area(80202,25)))?&format=json&apiKey=7a3heu7emrjz6qbsugmepbv6")

    binding.pry
    end

end
