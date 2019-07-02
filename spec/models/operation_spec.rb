# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operation, type: :model do
  let(:operation) { Fabricate(:operation) }

  it 'has a unique constraint on key' do
    expect { Fabricate(:operation, key: operation.key) }.to raise_error(ActiveRecord::RecordNotUnique)
  end

  it 'has a unique constraint on name' do
    expect { Fabricate(:operation, name: operation.name) }.to raise_error(ActiveRecord::RecordNotUnique)
  end

  it 'requires key' do
    expect { Fabricate(:operation, key: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires name' do
    expect { Fabricate(:operation, name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires description' do
    expect { Fabricate(:operation, description: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
