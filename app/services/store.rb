class Store

  attr_reader :longname,
              :city,
              :distance,
              :phone_number,
              :store_type

  def initialize(response = {})
    @longname = response[:longName]
    @distance = response[:distance]
    @phone_number = response[:phone]
    @store_type = response[:storeType]
  end

  def self.search_by_zip(zip)
    stores = ApiService.search_by_zip(zip)
    stores.map do |store|
      Store.new(store)
    end
  end
# And I should see the long name, city, distance, phone number and store type for each of the next 6 results
end
