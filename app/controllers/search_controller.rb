class SearchController < ApplicationController

  def index
    zip_code = params["search"]
    # @stores = Store.search_by_zip(zip_code)
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    api_return = @conn.get("stores((area(#{zip_code},25)))?&format=json&apiKey=#{api_key}&pageSize=50")

    reply = JSON.parse(api_return.body, symbolize_names: true)

    @stores = reply[:stores].map do |store|
      Store.new(store)
    end

  end

  private

    def api_key
      "&apiKey=#{ENV["API_KEY"]}"
    end

end
