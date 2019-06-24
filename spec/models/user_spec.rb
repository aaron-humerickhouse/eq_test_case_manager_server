require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can have roles' do
    assignment = Fabricate(:assignment)
    role = assignment.role
    user = assignment.user

    expect(user.roles).to eq [role]
  end

  describe '#jwt_payload' do
    let(:user) { Fabricate.build(:user) }
    let(:assignment) { Fabricate.build(:assignment, user: user) }
    let!(:permission) { Fabricate.build(:permission, role: assignment.role) }

    subject { user.jwt_payload }

    it 'includes target_type and id' do
      expect(subject[:target_type]).to eq 'USER'
      expect(subject[:target_id]).to eq user.id
    end

    it 'includes roles' do
      expect(subject[:roles].sort).to eq user.roles.map(&:key).sort
    end

    it 'includes operations' do
      expect(subject[:operations].sort).to eq user.roles.map(&:operations).flatten.map(&:key).sort
    end
  end
end
