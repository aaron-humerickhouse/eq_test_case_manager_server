# frozen_string_literal: true

Fabricator(:operation) do
  name do
    sequence(:name) do |i|
      "#{Faker::Movies::PrincessBride.character}_#{i}@example.com"
    end
  end
  key { |attrs| attrs[:name]&.slugify&.upcase }
  description { Faker::Movies::PrincessBride.quote }
end
