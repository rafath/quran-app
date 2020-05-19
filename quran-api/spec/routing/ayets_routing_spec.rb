require 'rails_helper'

RSpec.describe 'AyetsController', type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: "/ayets/show").to route_to("ayets#show")
    end
  end
end
