# Group Members: 
# Matt Teitz @mwteitz
# Frank Mugo @Frankmugo
# Mike Ciletti @michaelciletti
# Pat Wehman @wehman

def remove_whitespaces_and_dashes(isbn) 

	new_isbn = ""
	isbn.each_char do |isbn_char|

		if isbn_char != " " && isbn_char != "-"
			new_isbn += isbn_char
		end
		
	end

	return new_isbn

end

def all_numeric_digits?(isbn)
	numbers = "0123456789"

	isbn.each_char do |isbn_char|
		found_number = false
		numbers.each_char do |num|
			if isbn_char == num
				found_number = true
			end
		end
		if found_number == false
			return false
		end
	end

	return true
end

def validate_isbn?(isbn)
	
	if isbn.length < 10
		return false
	end

	isbn = remove_whitespaces_and_dashes(isbn)

	if isbn.length != 10 && isbn.length != 13
		return false
	end

	isbn_given_checksum = isbn[isbn.length - 1]
	isbn_checksum_removed = isbn[0..isbn.length - 2]
	
	if !all_numeric_digits?(isbn_checksum_removed)
		return false
	end
	
end