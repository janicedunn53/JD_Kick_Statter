class Player < ActiveRecord::Base
  belongs_to(:team)
  has_many(:kicker)
  has_many(:pitcher)
  has_many(:fielder)
  validates(:name, {:presence => :true})
  before_save(:titleize_name)

  private

  define_method(:titleize_name) do
    self.name=(name().titleize())
  end
end
