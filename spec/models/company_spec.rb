require 'rails_helper'

RSpec.describe Company, type: :model do
  describe '#name' do
    it 'is required' do
      expect(Fabricate.build(:company, name: nil).valid?).to eq false
    end

    it 'must be unique' do
      company = Fabricate.create(:company)
      expect { Fabricate.create(:company, name: company.name) }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
