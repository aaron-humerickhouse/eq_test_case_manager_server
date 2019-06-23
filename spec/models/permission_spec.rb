require 'rails_helper'

RSpec.describe Permission, type: :model do
  let(:permission) { Fabricate(:permission) }

  it 'requires role' do
    expect { Fabricate(:permission, role: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires operation' do
    expect { Fabricate(:permission, operation: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has a unique constraint on role and operation' do
    expect { Fabricate(:permission, role: permission.role, operation: permission.operation) }.to raise_error(ActiveRecord::RecordNotUnique)
  end

  it 'does not have a unique constraint on role' do
    expect { Fabricate(:permission, role: permission.role) }.not_to raise_error
  end

  it 'does not have a unique constraint on operation' do
    expect { Fabricate(:permission, operation: permission.operation) }.not_to raise_error
  end
end
