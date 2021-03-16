require 'minitest/autorun'
require './recipe.rb'

class TestRecipe < Minitest::Test
  def test_recipe_info
    query = Recipe.new('omelet')
    assert_equal query.recipes.length, 10
    assert_equal 'Baked Omelet With Broccoli &amp; Tomato', query.recipes[0]['title']
    assert_equal 'http://www.recipezaar.com/Baked-Omelet-With-Broccoli-Tomato-325014', query.recipes[0]['href']
    assert_equal 'milk, cottage cheese, broccoli, cheddar cheese, basil, onion powder, eggs, garlic powder, roma tomato, salt', query.recipes[0]['ingredients']
    assert_equal 'http://img.recipepuppy.com/123889.jpg', query.recipes[0]['thumbnail']
  end

  def test_fake_recipe_title
    query = Recipe.new("Parangari")
    assert_equal query.recipes.length, 0
  end

end
