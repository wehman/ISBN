require 'sinatra'
require_relative "isbn_number_pat.rb"
get '/' do
	#  'Hello Pat!' + ' ' + 'It is Friday.'
	erb :isbn_input
end

post '/isbnnum' do
#	num = params['ISBN']
	num = params[:ISBN]
	pgm_results =validate_isbn?(num)
	"Answer is #{pgm_results}"
end
