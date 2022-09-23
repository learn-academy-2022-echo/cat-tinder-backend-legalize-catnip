require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Random',
        age: 5,
        enjoys: 'Sleeping on trees',
        image: 'https://images.immediate.co.uk/production/volatile/sites/3/2022/03/Puss-in-Boots-2--b3ae519-e1647428302345.png?resize=620,413?quality=90&webp=true&resize=620,414'
      )

      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq(1)
    end
  end
describe "POST /create" do
  it "creates a cat" do
  
    cat_params = {
      cat: {
        name: 'Buster',
        age: 4,
        enjoys: 'Running in a park.',
        image: 'https://images.immediate.co.uk/production/volatile/sites/3/2022/03/Puss-in-Boots-2--b3ae519-e1647428302345.png?resize=620,413?quality=90&webp=true&resize=620,4140'
      }
    }

    post '/cats', params: cat_params
    expect(response).to have_http_status(200)

    cat = Cat.first
    p "cat.name", cat.name
    expect(cat.name).to eq 'Buster'
  end
  it "can't create a cat without a name" do
    cat_params = {
      cat: {
        name: "Puss in Boots",
        age: 4,
        image: "https://images.immediate.co.uk/production/volatile/sites/3/2022/03/Puss-in-Boots-2--b3ae519-e1647428302345.png?resize=620,413?quality=90&webp=true&resize=620,414"
      }
    }

    # send request
    post '/cats', params: cat_params

    expect(response).to have_http_status(422)

    json = JSON.parse(response.body)
    p json
    expect(json['enjoys']).to include "can't be blank"
  end

  it "can't create a cat without a age" do
    cat_params = {
      cat: {
        name: "Puss in Boots",
        enjoys: "dueling fast",
        image: "https://images.immediate.co.uk/production/volatile/sites/3/2022/03/Puss-in-Boots-2--b3ae519-e1647428302345.png?resize=620,413?quality=90&webp=true&resize=620,414"
      }
    }

    post '/cats', params: cat_params
    
    expect(response).to have_http_status(422)

    json = JSON.parse(response.body)
    p json
    expect(json['age']).to include "can't be blank"
  end
  it "can't create a cat without a enjoys" do
    cat_params = {
      cat: {
        name: "Puss in Boots",
        age: 6,
        image: "https://images.immediate.co.uk/production/volatile/sites/3/2022/03/Puss-in-Boots-2--b3ae519-e1647428302345.png?resize=620,413?quality=90&webp=true&resize=620,414"
      }
    }

    post '/cats', params: cat_params
    
    expect(response).to have_http_status(422)

    json = JSON.parse(response.body)
    p json
    expect(json['enjoys']).to include "can't be blank"
  end
  it "can't create a cat without a image" do
  
    cat_params = {
      cat: {
        name: "Puss in Boots",
        age: 3,
        enjoys: "dueling super fast"
      }
    }

    post '/cats', params: cat_params
    
    expect(response).to have_http_status(422)

    json = JSON.parse(response.body)
    p json
    expect(json['image']).to include "can't be blank"
  end
      it "can't create a cat without a enjoys that is at least 10 charcters long" do

    cat_params = {
      cat: {
        name: "Puss in Boots",
        age: 2,
        enjoys: "duel",
        image: "hhttps://images.immediate.co.uk/production/volatile/sites/3/2022/03/Puss-in-Boots-2--b3ae519-e1647428302345.png?resize=620,413?quality=90&webp=true&resize=620,414"
      }
    }

    post '/cats', params: cat_params
    
    expect(response).to have_http_status(422)

    json = JSON.parse(response.body)
    p json
    expect(json['enjoys']).to include "is too short (minimum is 10 characters)"
  end
 end
end