require 'rails_helper'

describe Recipe, type: :model do
  subject do
    Recipe.new(
      name: 'Tequila Mojito',
      preparation_time: '10',
      cooking_time: 10,
      description: "The  combination of good aged tequila, mint, and sugary syrup",
      public: true, 
      user_id: 1
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'displays description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'displays cooking time and preparation time' do
    expect(subject.cooking_time).to eq(10)
    expect(subject.preparation_time).to eq(10)
  end
end