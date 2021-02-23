# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Species.delete_all
# Films.delete_all
# Characters.delete_all

require 'open-uri'
require 'json'
require 'faker'

# PERSON MODEL

# Fetches and decodes JSON resources from the Star Wars API
def swapi_fetch(url)
  JSON.parse(URI.open(url).read)
end

# Build the "person by id" people endpoint url
def person_url(id)
  "https://swapi.dev/api/people/#{id}/"
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

# 83 Total Characters in API
character_ids = 1..83

character_ids.each do |character_id|
  person = swapi_fetch(person_url(character_id))
  # homeworld = swapi_fetch(person['homeworld'])
  films = person['films'].map { |film_url| swapi_fetch(film_url)}
  species = person['species'].map { |species_url| swapi_fetch(species_url)}


  puts "Name: #{person['name']}"
  puts "Born: #{person['birth_year']}"
  puts "Gender: #{person['gender']}"
  puts "Hair color: #{person['hair_color']}"
  puts "Height: #{person['height']}"
  # puts "Homeworld: #{homeworld['name']} (Population: #{homeworld['population']})"
  puts "Films: #{film_title_list(films)}"
  puts "Species: #{species_name_list(species)}"
  begin
    puts "Quote: #{Faker::Movies::StarWars.quote(character: "#{person['name']}")}"
  rescue ArgumentError
    puts "Quote: #{Faker::Movies::StarWars.quote}"
  end
  puts "\n\n\n"
end


# FILMS MODEL

# Build the "film by id" films endpoint url
def film_url(id)
  "https://swapi.dev/api/films/#{id}/"
end

# Format an unordered list of characters names from people endpoint data
def character_names_list(characters)
  character_names = characters.map { |c| c['name'] }
  character_names.join(', ')
end

# 6 Total Films in API
film_ids = 1..6

film_ids.each do |film_id|
  film = swapi_fetch(film_url(film_id))
  # films = person['films'].map { |film_url| swapi_fetch(film_url)}
  characters = film['characters'].map { |character_url| swapi_fetch(character_url)}
  species = film['species'].map { |species_url| swapi_fetch(species_url)}


  puts "Title: #{film['title']}"
  puts "Director: #{film['birth_year']}"
  puts "Release Date: #{film['release_date']}"
  puts "Characters: #{character_names_list(characters)}"
  puts "Species: #{species_name_list(species)}"
  puts "\n\n\n"
end



# SPECIES MODEL

# Build the "species by id" species endpoint url
def species_url(id)
  "https://swapi.dev/api/species/#{id}/"
end

# 37 Total Species in API
species_ids = 1..37

species_ids.each do |one_species_id|
  one_species = swapi_fetch(species_url(one_species_id))
  films = one_species['films'].map { |film_url| swapi_fetch(film_url)}
  characters = one_species['people'].map { |character_url| swapi_fetch(character_url)}

  puts "Name: #{one_species['name']}"
  puts "Classification: #{one_species['classification']}"
  puts "Average Height: #{one_species['average_height']}"
  puts "Average Lifespan: #{one_species['average_lifespan']}"
  puts "Skin color: #{one_species['skin_colors']}"
  puts "Language: #{one_species['language']}"
  puts "Characters: #{character_names_list(characters)}"
  puts "Films: #{film_title_list(films)}"
  puts "\n\n\n"
end