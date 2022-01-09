module Api
  module V1
    class CoachResource < JSONAPI::Resource
      attributes :name
      relationship :courses, to: :many
    end
  end
end
