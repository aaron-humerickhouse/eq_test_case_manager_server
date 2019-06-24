Fabricator(:role) do
  name { Faker::Movies::StarWars.vehicle }
  key { |attrs| attrs[:name]&.slugify&.upcase }
  description { Faker::Movies::StarWars.quote }
end
