# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Assignment, type: :model do
  let(:assignment) { Fabricate(:assignment) }

  it 'requires role' do
    expect { Fabricate(:assignment, role: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires user' do
    expect { Fabricate(:assignment, user: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires company' do
    expect { Fabricate(:assignment, company: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has a unique constraint on role, user, and company' do
    expect { Fabricate(:assignment, role: assignment.role, user: assignment.user, company: assignment.company) }.to raise_error(ActiveRecord::RecordNotUnique)
  end

  it 'does not have a unique constraint on role' do
    expect { Fabricate(:assignment, role: assignment.role) }.not_to raise_error
  end

  it 'does not have a unique constraint on user' do
    expect { Fabricate(:assignment, user: assignment.user) }.not_to raise_error
  end

  it 'does not have a unique constraint on company' do
    expect { Fabricate(:assignment, company: assignment.company) }.not_to raise_error
  end
end
