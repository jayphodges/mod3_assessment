FactoryGirl.define do
  factory :item do

    sequence :name do |i|
      "Item#{i}"
    end

    sequence :description do |i|
      "Description#{i}"
    end

    image_url "http://via.placeholder.com/350x350"

  end
end
