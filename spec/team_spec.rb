require('spec_helper')

describe(Team) do
  it {should have_many(:players)}
  it {should validate_presence_of(:name)}
end
