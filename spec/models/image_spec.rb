require 'rails_helper'

RSpec.describe Image, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:image) }

end
