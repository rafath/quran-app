class AyetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :chapter_id, :ayet_number, :content, :note

  attribute :ayet_image_url do |object|
    "#{Rails.configuration.api_url}files/images/#{object.ayet_image}"
  end

  attribute :ayet_mp3_url do |object|
    "#{Rails.configuration.api_url}files/sounds/mp3/#{object.ayet_mp3}"
  end

  set_type :ayet
end
