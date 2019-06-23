Fabricator(:user) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { |attrs| "#{attrs[:first_name].parameterize}-#{attrs[:last_name].parameterize}@example.com" }
  password 'Test1234'
  password_confirmation 'Test1234'
  confirmed_at Time.now
end
