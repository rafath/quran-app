class QueryType < GraphQL::Schema::Object
  description "The query root of this schema"

  # First describe the field signature:
  field :chapter, ChapterType, null: true do
    description "Find a post by ID"
    argument :id, ID, required: true
  end

  # # Then provide an implementation:
  # def chapter(id:)
  #   Chapter.find(id)
  # end
end
