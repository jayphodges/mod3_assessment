class SearchController < ApplicationController

  def index
    zip_code = params["search"]
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    api_return = @conn.get("stores((area(#{zip_code},25)))?&format=json&apiKey=#{api_key}")

    reply = JSON.parse(api_return.body, symbolize_names: true)


    end

    private

      def api_key
        "&apiKey=#{ENV["API_KEY"]}"
      end

end
