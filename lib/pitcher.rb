class Pitcher < ActiveRecord::Base
  belongs_to(:player)
end
