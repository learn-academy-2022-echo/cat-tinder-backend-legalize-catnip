require 'rails_helper'

RSpec.describe Cat, type: :model do
  cat = Cat.create
  it 'validate name exists in the database entry' do
    cat = Cat.create(age: 4, enjoys: 'sleeping', image: 'https://thiscatdoesnotexist.com/')
    expect(cat.errors[:name]).to_not be_empty
  end
  it 'validate age exists in the database entry' do
    cat = Cat.create(name:'Garfield' , enjoys: 'playing', image: 'https://thiscatdoesnotexist.com/')
    expect(cat.errors[:age]).to_not be_empty
  end
  it 'validate enjoys exists in the database entry'' do
    cat = Cat.create
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  it 'validate image exists in the database entry' do
    cat = Cat.create
    expect(cat.errors[:image]).to_not be_empty
  end
  it 'should validate that the enjoys is 10 characters long minimum in the database entry' do
    cat = Cat.create(name:"Puss in Boots", age: 4, enjoys: "dueling", image: "https://images.immediate.co.uk/production/volatile/sites/3/2022/03/Puss-in-Boots-2--b3ae519-e1647428302345.png?resize=620,413?quality=90&webp=true&resize=620,414/")

    expect(cat.errors[:enjoys]).to_not be_empty
  end
end