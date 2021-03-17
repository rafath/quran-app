module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :chapters, resolver: Queries::Chapters

    field :chapter, Types::ChapterType, null: false do
      argument :id, ID, required: true
    end

    def chapter(id:)
      Chapter.find(id)
    end

    field :analytics, [Types::AnalyticType], null: false do
      argument :ip, String, required: false
    end

    def analytics(ip:)
      ip.present? ? Analytic.where(ip: ip) : Analytic.all
    end
  end
end
