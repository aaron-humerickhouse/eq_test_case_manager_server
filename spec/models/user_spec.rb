require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can have roles' do
    assignment = Fabricate(:assignment)
    role = assignment.role
    user = assignment.user

    expect(user.roles).to eq [role]
  end

  it 'can have companies' do
    assignment = Fabricate(:assignment)
    company = assignment.company
    user = assignment.user

    expect(user.companies).to eq [company]
  end

  describe '#jwt_payload' do
    let(:company_1) { Fabricate(:company) }
    let(:company_2) { Fabricate(:company) }
    let(:user) { Fabricate(:user) }
    let(:assignment_1) { Fabricate(:assignment, user: user, company: company_1) }
    let(:assignment_2) { Fabricate(:assignment, user: user, company: company_2) }
    let!(:permission_1) { Fabricate(:permission, role: assignment_1.role) }
    let!(:permission_2) { Fabricate(:permission, role: assignment_2.role) }

    subject { user.jwt_payload }

    it 'includes principal_type and principal_id' do
      expect(subject[:principal_type]).to eq 'USER'
      expect(subject[:principal_id]).to eq user.id
    end


    it 'includes permissions' do
      expected_permissions = [
        {
          company_id: company_1.id,
          operations: [permission_1.operation.key]
        },
        {
          company_id: company_2.id,
          operations: [permission_2.operation.key]
        }
      ]
      expect(subject[:permissions]).to eq expected_permissions
    end
  end
end
