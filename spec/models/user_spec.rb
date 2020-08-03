require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:Fullname) }
    it { should validate_presence_of(:Username) }
    it { should validate_length_of(:Username).is_at_least(3) }
    it { should validate_length_of(:Fullname).is_at_least(3) }
  end

  describe 'associations' do
    it { should have_many(:opinions) }
    it { should have_many(:likes) }
    it { should have_many(:followed).with_foreign_key(:FollowerId).class_name('Following') }
    it { should have_many(:followers).with_foreign_key(:FollowedId).class_name('Following') }
  end
end
