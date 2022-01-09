module Api
  module V1
    class CourseResource < JSONAPI::Resource
      attributes :name, :self_assignable
      relationship :coach, to: :one
      relationship :activities, to: :many
      filter :self_assignable
    end
  end
end
