class Appearance < ApplicationRecord
     validates :rating, :inclusion => 1..5
     belongs_to :guest
     belongs_to :episode
end
