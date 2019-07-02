# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { Fabricate(:role) }

  it 'has a unique constraint on key' do
    expect { Fabricate(:role, key: role.key) }.to raise_error(ActiveRecord::RecordNotUnique)
  end

  it 'has a unique constraint on name' do
    expect { Fabricate(:role, name: role.name) }.to raise_error(ActiveRecord::RecordNotUnique)
  end

  it 'requires key' do
    expect { Fabricate(:role, key: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires name' do
    expect { Fabricate(:role, name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires description' do
    expect { Fabricate(:role, description: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has operations' do
    permission = Fabricate(:permission)
    role = permission.role
    operation = permission.operation
    expect(role.operations).to eq [operation]
  end
end
