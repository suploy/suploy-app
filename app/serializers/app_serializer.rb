class AppSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :repository
end
