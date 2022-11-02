require 'rails_helper'

RSpec.describe Partyer, type: :model do
  before(:each) do
    @partyer = Partyer.new(
      gender: 'Masculino',
      name: 'Bruce Wayne',
      birth_date: 18.years.ago,
      user: User.new()
    )
  end

  it "is valid with valid attributes" do
    expect(@partyer).to be_valid
  end

  it "is not valid without a user" do
    @partyer.user = nil
    expect(@partyer).to_not be_valid
    expect(@partyer.errors.full_messages).to include('User must exist')
  end

  it "is not valid without a name" do
    @partyer.name = nil
    expect(@partyer).to_not be_valid
    expect(@partyer.errors.full_messages).to include("Name can't be blank")
  end

  it "is not valid without a gender" do
    @partyer.gender = nil
    expect(@partyer).to_not be_valid
    expect(@partyer.errors.full_messages).to include("Gender can't be blank")
  end

  it "is not valid without a birth_date" do
    @partyer.birth_date = nil
    expect(@partyer).to_not be_valid
    expect(@partyer.errors.full_messages).to include("Birth date can't be blank")
  end

  it "is not valid if partyer is not an adult" do
    @partyer.birth_date = 10.years.ago
    expect(@partyer).to_not be_valid
    expect(@partyer.errors.full_messages).to include('Partyer must be an adult')
  end
end
