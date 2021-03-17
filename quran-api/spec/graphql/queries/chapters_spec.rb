# frozen_string_literal: true

module Queries
  describe Chapters, type: :request do
    describe '.resolve' do

      let(:chapter) { create(:chapter) }

      before do
        chapter
        post '/graphql', params: { query: query }
      end

      it 'returns all authors' do

        json = JSON.parse(response.body)
        # binding.pry

        data = json['data']['chapters']

        expect(data).to match_array [
                                      hash_including(
                                        'id' => be_present,
                                        'name' => chapter.name,
                                        'plName' => chapter.pl_name
                                      )
                                    ]
      end
    end

    def query
      <<GQL
        query {
          chapters {
            id
            name
            plName
            history
          }
        }
GQL
    end
  end
end
