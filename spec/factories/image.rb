FactoryBot.define do
  factory :image do
    title { FFaker::Lorem.word }
    image { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test_image_300x300.png'), 'image/png') }
    user
  end
end