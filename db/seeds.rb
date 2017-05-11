require 'open-uri'
require 'json'


puts 'Cleaning Database'
Cocktail.destroy_all

puts 'Creation Data in Database'
url_json = open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
json = JSON.parse(url_json.read)
json['drinks'].each do |filer|
  Ingredient.create(name: filer['strIngredient1'])
  print '.'
end


puts 'done'
puts Ingredient.all
