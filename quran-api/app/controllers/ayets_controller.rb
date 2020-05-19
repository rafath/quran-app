class AyetsController < ApplicationController
  expose :ayets, -> { chapter.ayets.order(:ayet_number).page(params[:page]) }

  def index
    render json: AyetSerializer.new(ayets).serialized_json
  end
end
