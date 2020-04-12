FactoryBot.define do
  factory :user do
    name      { FFaker::Name.name }
    email     { FFaker::Internet.email }
    password  { FFaker::Internet.password }

    trait :with_photo do
      photo { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-photo.png'), 'image/png') }
    end
  end
end