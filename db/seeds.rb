# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# CharacterSpecy.delete_all
# FilmCharacter.delete_all
# Species.delete_all
# Film.delete_all
# Character.delete_all

require 'open-uri'
require 'json'
require 'faker'

# Fetches and decodes JSON resources from the Star Wars API
def swapi_fetch(url)
  JSON.parse(URI.open(url).read)
end

# Build the "person by id" people endpoint url
def person_url(id)
  "https://swapi.dev/api/people/#{id}/"
end

# Build the "film by id" films endpoint url
def film_url(id)
  "https://swapi.dev/api/films/#{id}/"
end

# Build the "species by id" species endpoint url
def species_url(id)
  "https://swapi.dev/api/species/#{id}/"
end

# Format an unordered list of films titles from films endpoint data
def film_title_list(films)
  film_titles = films.map { |f| f['title'] }
  film_titles.join(', ')
end

# Formats an unordered list of species names from the species endpoint data
def species_name_list(species)
  species_names = species.map { |s| s['name'] }
  species_names.join(', ')
end

# Format an unordered list of characters names from people endpoint data
def character_names_list(characters)
  character_names = characters.map { |c| c['name'] }
  character_names.join(', ')
end


# PERSON MODEL

# 83 Total Characters in API
character_ids = 1..3

character_ids.each do |character_id|
  person = swapi_fetch(person_url(character_id))
  films = person['films'].map { |film_url| swapi_fetch(film_url)}
  species = person['species'].map { |species_url| swapi_fetch(species_url)}

  begin
    quote = Faker::Movies::StarWars.quote(character: "#{person['name']}")
  rescue ArgumentError
    quote = Faker::Movies::StarWars.quote
  end

  character = Character.create(
    name: person['name'],
    birth_year: person['birth_year'],
    gender: person['gender'],
    hair_color: person['hair_color'],
    height: person['height'],
    quote: quote
  )

  # if generated_film && generated_film.valid?
  # else
  #   puts "Invalid Film: #{film}"
  # end

  # Splits on the comma
  character_films = film_title_list(films).split(",").map(&:strip)
  character_films.each do |character_film|
    film = Film.find_or_create_by(title: character_film['title'],
                                  director: character_film['director'],
                                  release_date: character_film['release_date'])

    FilmCharacter.create(film: film, character: character)
  end

  character_species = species_name_list(species).split(",").map(&:strip)
  character_species.each do |character_specy|
    specy = Species.find_or_create_by(
      name: character_specy['name'],
      classification: character_specy['classification'],
      average_height: character_specy['average_height'],
      average_lifespan: character_specy['average_lifespan'],
      skin_colors: character_specy['skin_colors'],
      language: character_specy['language'])

    CharacterSpecies.create(species: specy, character: character)
  end

  # puts "Name: #{one_species['name']}"
  # puts "Classification: #{one_species['classification']}"
  # puts "Average Height: #{one_species['average_height']}"
  # puts "Average Lifespan: #{one_species['average_lifespan']}"
  # puts "Skin color: #{one_species['skin_colors']}"
  # puts "Language: #{one_species['language']}"
  # puts "Films: #{film_title_list(films)}"
  # puts "Species: #{species_name_list(species)}"
  # begin
  #   puts "Quote: #{Faker::Movies::StarWars.quote(character: "#{person['name']}")}"
  # rescue ArgumentError
  #   puts "Quote: #{Faker::Movies::StarWars.quote}"
  # end
  # puts "\n\n\n"

end


# FILMS MODEL

# 6 Total Films in API
# film_ids = 1..3

# film_ids.each do |film_id|
#   film = swapi_fetch(film_url(film_id))
#   # films = person['films'].map { |film_url| swapi_fetch(film_url)}
#   characters = film['characters'].map { |character_url| swapi_fetch(character_url)}
#   species = film['species'].map { |species_url| swapi_fetch(species_url)}

#   # generated_film = Film.create(title: film['title'])

#   # puts "Title: #{film['title']}"
#   # puts "Director: #{film['director']}"
#   # puts "Release Date: #{film['release_date']}"
#   puts "Characters: #{character_names_list(characters)}"
#   puts "Species: #{species_name_list(species)}"
#   puts "\n\n\n"

#   # # Splits up the characters which are comma deliminated
#   # film_characters = character_names_list(characters).split(", ").map(&:strip)
#   # film_characters.each do |one_character|
#   #   character = Character.find_or_create_by()
#   # end
# end



# SPECIES MODEL

# 37 Total Species in API
# species_ids = 1..3

# species_ids.each do |one_species_id|
#   one_species = swapi_fetch(species_url(one_species_id))
#   films = one_species['films'].map { |film_url| swapi_fetch(film_url)}
#   characters = one_species['people'].map { |character_url| swapi_fetch(character_url)}

#   puts "Name: #{one_species['name']}"
#   puts "Classification: #{one_species['classification']}"
#   puts "Average Height: #{one_species['average_height']}"
#   puts "Average Lifespan: #{one_species['average_lifespan']}"
#   puts "Skin color: #{one_species['skin_colors']}"
#   puts "Language: #{one_species['language']}"
#   puts "Characters: #{character_names_list(characters)}"
#   puts "Films: #{film_title_list(films)}"
#   puts "\n\n\n"
# end