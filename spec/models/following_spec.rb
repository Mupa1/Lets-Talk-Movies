require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'associations' do
    it { should belong_to(:Follower) }
    it { should belong_to(:Followed) }
  end
end
