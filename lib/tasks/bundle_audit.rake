# frozen_string_literal: true

if %w(development test).include? Rails.env
  require 'bundler/audit/task'
  Bundler::Audit::Task.new

  task default: 'bundle:audit'
end
