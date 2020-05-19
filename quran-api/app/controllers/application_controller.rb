class ApplicationController < ActionController::API
  expose :chapter, id: -> { params[:chapter_id] }

end
