# frozen_string_literal: true

Fabricator(:role) do
  name do
    sequence(:name) do |i|
      "#{Faker::Movies::StarWars.vehicle}_#{i}@example.com"
    end
  end
  key { |attrs| attrs[:name]&.slugify&.upcase }
  description { Faker::Movies::StarWars.quote }
end
