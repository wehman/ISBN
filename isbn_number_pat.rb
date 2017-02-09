# Group Members: 
# Matt Teitz @mwteitz
# Frank Mugo @Frankmugo
# Mike Ciletti @michaelciletti
# Pat Wehman @wehman

def remove_whitespaces_and_dashes(isbn)
	# replace - with nothing
	# isbn = isbn.gsub("-", "")

	# method 1 of removing non numeric characters
	# /[^0-9] match anything other than a digit
	# NO LONGER USING GSUB WITH REGEX to remove whitespaces and dashes
	# This code was from Wednesday late afternoon class work


	# String.gsub replaces all occurrences of first String argument with second String argument
	# replace whitespace with nothing
	# isbn = isbn.gsub(" ", "")
# this is a regular expression
	# the ^ is a NOT logical operator
	# the / .. / is a character class matching all characters between //
	# the [0-9] match any single character 0,1,2,3,4,5,6,7,8,9
	# we do not want to remove the 'x' character for ISBN-10
	# isbn = isbn.gsub(/[^0-9x]/, "")

 #####################################################################################

	# method 2 of removing non numeric characters
	# nested looping structure to find a pattern inside a string 
	# the string is isbn
	# the pattern is whitespaces and dashes
	# we are creating a new string to preserve the order of characters

	new_isbn = ""
	isbn.each_char do |isbn_char|
		# I could count total whitespaces and dashes so that 
		# a million whitespaces and dashes cannot be considered valid
		# for isbn10, that total max could be 3
		# for isbn13, that total max could be 4

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

def isbn10_checksum_valid_character?(given_checksum)
	acceptable_characters = "0123456789xX" # included uppercase and lowercase X
	
	acceptable_characters.each_char do |c|
		if c == given_checksum
			return true
		end
	end
	
	return false
end

def isbn13_checksum_valid_character?(given_checksum)
	acceptable_characters = "0123456789"
	
	acceptable_characters.each_char do |c|
		if c == given_checksum
			return true
		end
	end

	return false
end

def calculate_ISBN10_checksum(isbn10_checksum_removed)
	calculated_isbn10_checksum = ""
	sum = 0
	multiplier = 1
	isbn10_checksum_removed.each_char do |isbn_char|
		sum += isbn_char.to_i * multiplier
		multiplier += 1
	end

	result = sum % 11

	if result == 10
		calculated_isbn10_checksum = "X"
	else
		calculated_isbn10_checksum = result.to_s
	end

	return calculated_isbn10_checksum
end

def calculate_ISBN13_checksum(isbn13)

	calculated_isbn13_checksum = ""
	sum = 0
	position_counter = 1
	
	isbn13.each_char do |isbn_char|

		if position_counter % 2 == 1

			sum += isbn_char.to_i * 1
		else
			sum += isbn_char.to_i * 3
		end

		position_counter += 1
	end

	result = sum % 10
	result = 10 - result
	result = result % 10

	calculated_isbn13_checksum = result.to_s

	return calculated_isbn13_checksum
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
	
	if isbn.length == 10 && isbn10_checksum_valid_character?(isbn_given_checksum) != true
		return false
	end

	if isbn.length == 13 && isbn13_checksum_valid_character?(isbn_given_checksum) != true
		return false
	end

	if isbn.length == 10
		calculated_isbn10_checksum = calculate_ISBN10_checksum(isbn_checksum_removed)

		# must downcase checksum for cases of uppercase X and lowercase x being compared
		if calculated_isbn10_checksum.downcase == isbn_given_checksum.downcase
			return true
		else
			return false
		end
		
	end

	if isbn.length == 13
		calculated_isbn13_checksum = calculate_ISBN13_checksum(isbn_checksum_removed)
		if calculated_isbn13_checksum == isbn_given_checksum
			return true
		else
			return false
		end
	end
end