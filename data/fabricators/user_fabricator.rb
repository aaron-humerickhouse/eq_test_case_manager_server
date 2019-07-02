# frozen_string_literal: true

Fabricator(:user) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { |attrs| "#{attrs[:first_name].parameterize}-#{attrs[:last_name].parameterize}@example.com" }
  password 'Test1234'
  password_confirmation 'Test1234'
  confirmed_at Time.zone.now
end

Fabricator(:admin, from: :user) do
  roles [Role.find_by(key: 'ADMIN')]
  email { sequence(:email) { |i| "admin#{i}@example.com" } }
end

Fabricator(:superuser, from: :user) do
  roles [Role.find_by(key: 'SUPERUSER')]
  email { sequence(:email) { |i| "superuser#{i}@example.com" } }
end

Fabricator(:test_creator, from: :user) do
  roles [Role.find_by(key: 'TEST-CREATOR')]
  email { sequence(:email) { |i| "test_creator#{i}@example.com" } }
end

Fabricator(:tester, from: :user) do
  roles [Role.find_by(key: 'TESTER')]
  email { sequence(:email) { |i| "tester#{i}@example.com" } }
end

Fabricator(:reporter, from: :user) do
  roles [Role.find_by(key: 'REPORTER')]
  email { sequence(:email) { |i| "reporter#{i}@example.com" } }
end
