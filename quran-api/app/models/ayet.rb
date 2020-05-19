class Ayet < ApplicationRecord
  belongs_to :chapter

  def ayet_image
    "%d_%d.png" % [chapter_id, ayet_number]
  end

  def ayet_mp3
    "%03d%03d.mp3" % [chapter_id, ayet_number]
  end
end
