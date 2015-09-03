class Team < ActiveRecord::Base
  has_many(:players)
  validates(:name, {presence: true})
  before_save(:titleize_name)

  private

  define_method(:titleize_name) do
    self.name=(name().titleize())
  end
end
