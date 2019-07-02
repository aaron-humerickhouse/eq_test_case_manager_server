# frozen_string_literal: true

# Base mailer for other mailers to inherit
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
