# frozen_string_literal: true

if %w[development test].include? Rails.env
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new do |task|
    task.requires << 'rubocop-rails'
  end
end
