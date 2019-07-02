# frozen_string_literal: true

# Settings class for application.yml
# access via Settings.setting1.subsetting2
class Settings < Settingslogic
  source Rails.root.join('config', 'application.yml')
  namespace Rails.env
end
