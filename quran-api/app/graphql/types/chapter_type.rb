module Types
  class ChapterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :pl_name, String, null: true
    field :chapter_number, Int, null: true
    field :ayets_quantity, Int, null: true
    field :history, String, null: true
    field :ayets, [Types::AyetType], null: true
  end
end
