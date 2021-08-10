d1 = Director.create[name: Faker::Name.name, bio: Faker::Movie.title]
d2 = Director.create[name: Faker::Name.name, bio: Faker::Movie.title]
d3 = Director.create[name: Faker::Name.name, bio: Faker::Movie.title]
d4 = Director.create[name: Faker::Name.name, bio: Faker::Movie.title]

10.times do
 Movie.create(
    title: [Faker::Movie.title], 
    year: [1984, 1985, 1987, 1988, 1989].sample,
    rating: (0..10).to_a.sample,
    director: [d1, d2, d3, d4].sample, 
)
end
