require 'httparty'

# Class that will call the IMDb website thru http
class Siskel

  def initialize(title, options = {})
    # IMDb API website now requires an api key per suer.  Make sure you add yours.
    # ?apikey=xxxxxxxxx
    # and save it in your .env file
    url = "http://www.omdbapi.com/?apikey=#{ENV['API_KEY']}&t=#{title}"
    options.keys.each do |k|
      url += "&#{k}=#{options[k]}"
    end if options

    @movie = HTTParty.get(url)
    if true? @movie['Response']
      @movie.each do |k,v|
        # creates all the instance variables i.e. @title = @movie['Title']
        instance_variable_set(:"@#{k.downcase}", v)
        # creates all the accessors i.e. attr_reader :movie
        add_accessor k.downcase
      end
    else
      @title = @movie['Error']
      add_accessor(:title)
    end
  end

  def true?(obj)
    obj.to_s.downcase == "true"
  end

  def add_accessor(attr)
    eigenclass = class<<self; self; end
    eigenclass.class_eval do
      attr_reader attr.downcase
    end
  end
end
