require 'httparty'
require 'json'

class Recipe
  attr_accessor :recipes

  def initialize(title)
    @recipe = JSON.parse(HTTParty.get("http://www.recipepuppy.com/api/?q=#{title}"))
    @recipes = @recipe["results"]
  end
end
