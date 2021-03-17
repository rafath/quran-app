module Types
  class AnalyticType < Types::BaseObject
    field :id, ID, null: false
    field :chapter_id, Int, null: true
    field :ip, String, null: true
    field :played_ayet_id, Int, null: true
  end
end
