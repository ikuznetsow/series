require_relative 'films'

describe "Series function" do 
	before do 
		@serie_list = FilmsList.new('series.txt')
	end
	it "search the rating in imdb" do
		expect @serie_list.rating_of("The Wire") == 9.4
	end	
	it "search number of films in imdb" do
		expect @serie_list.number_of("Cat") == 202
	end
	it "search for most episodes from" do
		expect @serie_list.most_episodes_from() == 10
	end
	it "outputs highest rank of series" do
		expect(@serie_list.first_by_rating).to eq(9.6)
	end
end
