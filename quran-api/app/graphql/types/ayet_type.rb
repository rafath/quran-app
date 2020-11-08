module Types
  class AyetType < Types::BaseObject
    field :id, ID, null: false
    field :chapter_id, Integer, null: true
    field :ayet_type, String, null: true
    field :ayet_number, Int, null: true
    field :content, String, null: true
    field :note, String, null: true
    field :ayet_mp3_url, String, null: true
    field :ayet_image_url, String, null: true

    def ayet_mp3_url
      "#{Rails.configuration.api_url}files/sounds/mp3-2/#{object.ayet_mp3}"
    end

    def ayet_image_url
      "#{Rails.configuration.api_url}files/images/#{object.ayet_image}"
    end
  end
end
