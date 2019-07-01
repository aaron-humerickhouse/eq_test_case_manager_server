Fabricator(:operation) do
  name { sequence(:name) { |i| 
    "#{Faker::Movies::PrincessBride.character}_#{i}@example.com" 
  }}
  key { |attrs| attrs[:name]&.slugify&.upcase }
  description { Faker::Movies::PrincessBride.quote }
end
