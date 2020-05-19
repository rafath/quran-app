class ChapterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :pl_name, :chapter_number, :ayets_quantity
  attributes :history,  if: Proc.new { |record, params|
    params && params[:with_history].present?
  }
  set_type :chapter

  # has_many :ayets
end
