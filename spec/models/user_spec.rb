require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:password).is_at_least(8).is_at_most(72) }
  it { should have_many(:images).dependent(:destroy) }
end
