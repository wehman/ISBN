require 'sinatra'
require_relative 'isbn_number_pat.rb'
	get '/' do    
	erb :getisbn, :locals => {:display_result => ""}
	end

	post '/isbn_num' do    
		num = params[:isbn]    validate_isbn(num)?result = "VALID" : result = "NOT Valid"
		    @num = num.delete("\"")
		         # delete quotes if supplied during data entry so not to imply they are part of valid isbn     
		         display_result = "ISBN  #{@num} is #{result}"    erb :getisbn, :locals => {:display_result => display_result}
		     end