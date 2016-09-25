class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :title, :start, :end, :day, :user_id
end
