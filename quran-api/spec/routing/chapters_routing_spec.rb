require 'rails_helper'

RSpec.describe 'ChaptersController', type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: "/chapters/show").to route_to("chapters#show")
    end
  end
end
