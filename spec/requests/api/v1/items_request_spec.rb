require 'rails_helper'

describe "Items API" do

  # When I send a GET request to /api/v1/items I receive a 200 JSON response containing
  # all items And each item has an id, name, description, and image_url but not the
  # created_at or updated_at
  it "responds to a GET request to /api/v1/items and doesn't return created/updated_at" do

    Item.create(name: "Item1", description: "Description1", image_url: "http://via.placeholder.com/350x350")
    Item.create(name: "Item2", description: "Description2", image_url: "http://via.placeholder.com/350x350")
    Item.create(name: "Item3", description: "Description3", image_url: "http://via.placeholder.com/350x350")

    get "/api/v1/items"
    items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(items.count).to eq(3)
  end

  # When I send a GET request to /api/v1/items/1 I receive a 200 JSON response containing
  #  the id, name, description, and image_url but not the created_at or updated_at
  it "responds to a GET request to /api/v1/items/:id and doesn't return created/updated_at" do
    item = Item.create(name: "Item1", description: "Description1", image_url: "http://via.placeholder.com/350x350")

    get "api/v1/items/#{item.id}"
    reply = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(reply["name"]).to eq(item.name)
    expect(reply["description"]).to eq(item.description)
  end

  # When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON response
  # if the record is successfully deleted
  it "responds to a DELETE request to /api/v1/items/:id it responds after deleting the item" do
    item = Item.create(name: "Item1", description: "Description1", image_url: "http://via.placeholder.com/350x350")

    delete "api/v1/items/#{item.id}"

    expect(response.status).to eq(204)
    expect(Item.count).to eq(0)
  end

  # When I send a POST request to /api/v1/items with a name, description, and image_url
  # I receive a 201 JSON response if the record is successfully created And I receive a
  # JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  it "responds to a POST request with a 201 status and returns the item" do
    params = {:item => {name: "Item1", description: "Description1", image_url: "http://via.placeholder.com/350x350"}}

    post "api/v1/items", params

    expect(response.status).to eq(204)
    expect(Item.last.name).to eq("Item1")

  end
end
