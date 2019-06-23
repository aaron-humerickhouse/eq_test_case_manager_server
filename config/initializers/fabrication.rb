if Rails.env.development?
  Fabrication.configure do |config|
    config.fabricator_path = 'data/fabricators'
    config.path_prefix = Rails.root
    config.sequence_start = 10000
  end
  
  Rails.logger.info 'Searching for Fabrigation Definitions'
  Fabrication.manager.load_definitions
end
