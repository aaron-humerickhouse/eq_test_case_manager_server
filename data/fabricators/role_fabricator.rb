Fabricator(:role) do
  name { sequence(:name) { |i| 
    "#{Faker::Movies::StarWars.vehicle}_#{i}@example.com" 
  }}
  key { |attrs| attrs[:name]&.slugify&.upcase }
  description { Faker::Movies::StarWars.quote }
end
