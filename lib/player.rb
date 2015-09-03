class Player < ActiveRecord::Base
  belongs_to(:team)
  has_many(:kickers)
  has_many(:pitchers)
  has_many(:fielders)
  validates(:name, {:presence => :true})
  before_save(:titleize_name)

  private

  define_method(:titleize_name) do
    self.name=(name().titleize())
  end
end
