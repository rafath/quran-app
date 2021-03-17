module Queries
  class Chapters < BaseQuery
    # chapters
    type [Types::ChapterType], null: false

    def resolve
      ::Chapter.all
    end
  end
end
