class ApiService
  attr_reader :conn
  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def search_by_zip(zip_code)
    reply = @conn.get("stores((area(#{zip_code},25)))?&format=json&apiKey=#{api_key}&pageSize=50")
    JSON.parse(reply.body, symbolize_names: true)[:stores]
  end


    private

      def api_key
        "&apiKey=#{ENV["API_KEY"]}"
      end

end
