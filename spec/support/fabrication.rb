# frozen_string_literal: true

Fabrication.configure do |config|
  config.fabricator_path = 'data/fabricators'
  config.path_prefix = Rails.root
  config.sequence_start = 10_000
end
