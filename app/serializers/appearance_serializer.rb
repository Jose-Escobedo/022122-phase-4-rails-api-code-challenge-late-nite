class AppearanceSerializer < ActiveModel::Serializer
  attributes :id, :rating
  belongs_to :guest
  belongs_to :episode
end
