require 'imdb'

class Film
	def find_imdb(film_to_find)
		puts "Searching in IMDB for #{film_to_find.gsub("\n",'')} ... "
		@found_films = Imdb::Search.new(film_to_find).movies
	end

	def rating_of(film_to_find)
		find_imdb(film_to_find)
		@found_films.first.rating
	end

	def number_of(film_to_find)
		find_imdb(film_to_find)
		@found_films.size
	end

	def seasons_of(film_to_find)
		find_imdb(film_to_find)
		cur_serie = Imdb::Serie.new(@found_films.first.id)
		cur_serie.seasons.size
	end
end


class FilmsList < Film
	def initialize (file_to_load)
		@movies_list = File.open(file_to_load, 'r').readlines #.gsub("\n","")
	end
	
	def first_by_rating
		movies = []
		@movies_list.map do |cur_movie| movies << [cur_movie.gsub("\n",''), rating_of(cur_movie)] end	
		movies.sort! { |(_,x),(_,y)| y <=> x}
		return movies[0][1]
	end		

	def most_episodes_from
		movies = []
		@movies_list.map do |cur_movie| movies << [cur_movie.gsub("\n",''), seasons_of(cur_movie)] end
		movies.sort! { |(_,x),(_,y)| y <=> x}
		return movies[0][1]			
	end
end
