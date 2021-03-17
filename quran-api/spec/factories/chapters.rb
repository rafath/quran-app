FactoryBot.define do
  factory :chapter do
    name { FFaker::Book.title }
    pl_name { FFaker::Book.title }
    history { FFaker::Book.description }
    chapter_number { 5 }
    ayets_quantity { 15 }
  end
end
