Fabricator(:operation) do
  name { Faker::Movies::PrincessBride.character }
  key { |attrs| attrs[:name]&.slugify&.upcase }
  description { Faker::Movies::PrincessBride.quote }
end
