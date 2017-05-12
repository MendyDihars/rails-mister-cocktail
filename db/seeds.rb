require 'open-uri'
require 'json'


puts 'Cleaning Database'

Dose.destroy_all
puts 'doses cleaning done'

Cocktail.destroy_all
puts 'cocktails cleaning done'

Ingredient.destroy_all
puts 'ingredients cleaning done'

puts 'Creation Ingredients Data in Database'
url_json = open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
json = JSON.parse(url_json.read)

json['drinks'].each do |filer|
  Ingredient.create(name: filer['strIngredient1'])
  print '🍎 '
end

puts 'Creation Cocktails Data in Database'
cocktails_json = open("http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail")
json_cocktail = JSON.parse(cocktails_json.read)

json_cocktail['drinks'].each do |item|
  cocktail = Cocktail.create!(name: item['strDrink'])
  p item['strDrinkThumb']
  cocktail.photo_url = item['strDrinkThumb'] unless item['strDrinkThumb'].nil?
  print '🍸 '
end

cocktails = Cocktail.all
cocktails.each do |c|
  [1, 2, 3].sample.times do
    ingredients = Ingredient.all.sample
    dodo = c.doses.new(ingredient_id: ingredients.id)
    dodo.save!
    print '✈ '
  end
end
puts 'done'
