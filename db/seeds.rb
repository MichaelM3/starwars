require 'rest-client'
require 'json'

# name, films, gender, species

9.times do |i|
    response_string = RestClient.get("https://swapi.dev/api/people/?page=#{i+1}")
    response_hash = JSON.parse(response_string)
    results = response_hash["results"]

    # Human species link currently not working on swapi
    results.each do |person| 
        if person["species"].length < 1
            Person.create(name: person["name"], films: person["films"].length, gender: person["gender"], species: "Human")
        else
            species_string = RestClient.get(person["species"][0])
            species_name = JSON.parse(species_string)["name"]    
            Person.create(name: person["name"], films: person["films"].length, gender: person["gender"], species: species_name)
        end
    end
end
puts "DONE SEEDING"