class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :"", :except, :"[", :""
end
