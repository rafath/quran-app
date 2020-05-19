# frozen_string_literal: true

Rails.application.routes.draw do
  get '/chapters(/:with_history)' => 'chapters#index', with_history: /\d+/

  # always keep on bottom
  get '/:chapter_id/ayets/:page' => 'ayets#index', defaults: { page: 1 }, page: /\d+/
  get '/:chapter_id(/:with_history)' => 'chapters#show', chapter_id: /\d+/, with_history: /\d+/
end
