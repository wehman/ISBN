require 'sinatra'

require_relative "isbn_number_pat.rb"

get '/' do
	erb :isbn_input  # embedded Ruby
end

post '/isbnnum' do
#	num = params['ISBN']    same as next line
	num = params[:ISBN]
	pgm_results =validate_isbn?(num) # returns a T or F 
	"Answer is #{pgm_results}"
end
