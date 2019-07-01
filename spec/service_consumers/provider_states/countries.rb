Pact.provider_states_for "EQ - TCM UI" do
  provider_state "With a company with id of 1" do
    set_up do
      allow(Company).to receive(:find).and_return(Fabricate.create(:company))
    end
  end

  provider_state "Having a company" do
    set_up do
      Company.count >= 1 || Fabricate.create(:company)
    end
  end
end
