class ChaptersController < ApplicationController
  expose(:chapters) { Chapter.all.order(:id) }

  def index
    render json: ChapterSerializer.new(chapters, params: { with_history: params[:with_history] }).serialized_json
  end

  def show
    render json: ChapterSerializer.new(chapter, params: { with_history: params[:with_history] }).serialized_json
  end
end
