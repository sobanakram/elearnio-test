module Api
  module V1
    class ActivityResource < JSONAPI::Resource
      attributes :name

      relationship :course, to: :one
    end
  end
end
