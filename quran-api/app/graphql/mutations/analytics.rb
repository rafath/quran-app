module Mutations
  class Analytics < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :analytic, Types::AnalyticType, null: false
    field :errors, [String], null: false


    # TODO: define arguments
    argument :chapter_id, Int, required: true
    argument :ip, String, required: true
    argument :played_ayet_id, Int, required: false

    # TODO: define resolve method
    def resolve(**args)
      anal = Analytic.new(args)
      if anal.save
        {
          analytic: anal,
          errors: []
        }
      else
        {
          analytic: nil,
          errors: anal.errors.full_messages
        }
      end
    end

    # ----------------
    # null true
    #
    #   argument :body, String, required: true
    #   argument :post_id, ID, required: true
    #
    #   field :comment, Types::Comment, null: true
    #   field :errors, [String], null: false
    #
    #   def resolve(body:, post_id:)
    #     post = Post.find(post_id)
    #     comment = post.comments.build(body: body, author: context[:current_user])
    #     if comment.save
    #       # Successful creation, return the created object with no errors
    #       {
    #         comment: comment,
    #         errors: [],
    #       }
    #     else
    #       # Failed save, return the errors to the client
    #       {
    #         comment: nil,
    #         errors: comment.errors.full_messages
    #       }
    #     end
    #   end
    #
  end
end
