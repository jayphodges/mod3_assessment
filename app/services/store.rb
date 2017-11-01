class Store

  attr_reader :longname,
              :city,
              :distance,
              :phone_number,
              :store_type

  def initialize(response = {})
    @response = response
    @longname = response[:longName]
    @distance = response[:distance]
    @phone_number = response[:phone]
    @store_type = response[:storeType]
  end

# And I should see the long name, city, distance, phone number and store type for each of the next 6 results
end
