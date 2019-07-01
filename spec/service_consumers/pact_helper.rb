require 'pact/provider/rspec'
require 'rails_helper'

# Require the provider states files for each service consumer
require 'service_consumers/provider_states/countries'

Pact.service_provider "EQ - TCM Server" do
  provider_version = ENV['TRAVIS_COMMIT'] || `git rev-parse --verify HEAD`
  publish_flag = ENV['PUBLISH_VERIFICATION_RESULTS'] == "true"

  app_version(provider_version)
  publish_verification_results(publish_flag)

  honours_pacts_from_pact_broker  do
    pact_broker_base_url Settings.pact.broker.host, { username: Settings.pact.broker.username, password: Settings.pact.broker.password}
  end
end
