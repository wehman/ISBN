# Group Members: 
# Matt Teitz @mwteitz
# Frank Mugo @Frankmugo
# Mike Ciletti @michaelciletti
# Pat Wehman @wehman

require "minitest/autorun"
require_relative "isbn_number.rb"

class TestISBNNumber < Minitest::Test

	############### testing remove_whitespaces_and_dashes function ##################

	# rwad is remove_whitespaces_and_dashes
	# d is a dash in the test function name
	# s is a space in the test function name
	def test_rwad_pass_0d321d14653d0_returns_0321146530
		assert_equal("0321146530", remove_whitespaces_and_dashes("0-321-14653-0"))
	end

	def test_rwad_pass_0s321s14653s0_returns_0321146530
		assert_equal("0321146530", remove_whitespaces_and_dashes("0 321 14653 0"))
	end

	def test_rwad_pass_0s3d21s14d653s0d_returns_0321146530
		assert_equal("0321146530", remove_whitespaces_and_dashes("0 3-21 14-653 0-"))
	end


	################### testing all_numeric_digits? function ##########################
	# and is all_numeric_digits? function
	def test_and_pass_1919fdjksl3_return_false
		assert_equal(false, all_numeric_digits?("1919fdjksl3"))
	end

	def test_and_pass_0123456789_return_true
		assert_equal(true, all_numeric_digits?("0123456789"))
	end


	############## testing isbn10_checksum_valid_character? function #######################
	# icvc is isbn10_checksum_valid_character? function
	def test_icvc_pass_A_returns_false
		assert_equal(false, isbn10_checksum_valid_character?("A"))
	end

	def test_icvc_pass_1_returns_true
		assert_equal(true, isbn10_checksum_valid_character?("1"))
	end

	def test_icvc_pass_5_returns_true
		assert_equal(true, isbn10_checksum_valid_character?("5"))
	end

	def test_icvc_pass_X_returns_true
		assert_equal(true, isbn10_checksum_valid_character?("X"))
	end

	def test_icvc_pass_x_returns_true
		assert_equal(true, isbn10_checksum_valid_character?("x"))
	end

	####### testing isbn13_checksum_valid_character? function ########################
	# icvc13 is isbn13_checkum_valid_character? function
	def test_icvc13_pass_A_returns_false
		assert_equal(false, isbn13_checksum_valid_character?("A"))
	end

	def test_icvc13_pass_3_returns_true
		assert_equal(true, isbn13_checksum_valid_character?("3"))
	end

	def test_icvc13_pass_X_returns_false
		assert_equal(false, isbn13_checksum_valid_character?("X"))
	end

	###################testing calculate_ISBN10_checksum############################
	# cic10 is calculate_ISBN10_checksum
	def test_cic10_pass_012345678_returns_9
		assert_equal("9", calculate_ISBN10_checksum("012345678"))
	end

	# if sum % 11 is 10, return X for checksum
	# changed first digit from 0 to 1, effectively adding 1 to total sum
	def test_cic10_pass_112345678_returns_X
		assert_equal("X", calculate_ISBN10_checksum("112345678"))
	end

	def test_cic10_pass_022345678_returns_0
		assert_equal("0", calculate_ISBN10_checksum("022345678"))
	end

	def test_cic10_pass_122345678_returns_1
		assert_equal("1", calculate_ISBN10_checksum("122345678"))
	end
	#################### testing calculate_ISBN13_checksum #############################
	# cic13 is calculate_ISBN13_checksum
	def test_cic13_pass_0123456789012_returns_0
		assert_equal("0", calculate_ISBN13_checksum("0123456789012"))
	end

	def test_cic13_pass_1223456789012_returns_6
		assert_equal("6", calculate_ISBN13_checksum("1223456789012"))
	end

	def test_cic13_pass_3333456789012_returns_0
		assert_equal("0", calculate_ISBN13_checksum("3333456789012"))
	end

	################## testing validate_isbn? function #############################################
	def test_validate_pass_012_returns_false
		assert_equal(false, validate_isbn?("012"))
	end

	# d is a dash

	# valid isbn13
	# 978-0-13-149505-0
	def test_validate_pass_978d0d13d149505d0_returns_true
		assert_equal(true, validate_isbn?("978-0-13-149505-0"))
	end

	# valid isbn13
	# 9780470059029
	def test_validate_pass_9780470059029_returns_true
		assert_equal(true, validate_isbn?("9780470059029"))
	end
	# s is space
	# valid isbn13
	# 978 0 471 48648 0
	def test_validate_pass_978s0s471s48648s0_returns_true
		assert_equal(true, validate_isbn?("978 0 471 48648 0"))
	end

	# valid isbn10
	# 0471958697
	def test_validate_pass_0471958697_returns_true
		assert_equal(true, validate_isbn?("0471958697"))
	end

	# valid isbn 10
	# 0-321-14653-0
	def test_validate_pass_0d321d14653d0_returns_true
		assert_equal(true, validate_isbn?("0-321-14653-0"))
	end

	# valid isbn 10
	# 877195869x
	def test_validate_pass_877195869x_returns_true
		assert_equal(true, validate_isbn?("877195869x"))
	end

	# invalid isbn13
	# 4780470059029
	def test_validate_pass_4780470059029_returns_false
		assert_equal(false, validate_isbn?("4780470059029"))
	end

	def test_validate_pass_0d321atsign14653d0_returns_false
		assert_equal(false, validate_isbn?("0-321@14653-0"))
	end

	def test_validate_pass_877195x869_returns_false
		assert_equal(false, validate_isbn?("877195x869"))
	end

	def test_validate_pass_empty_string_returns_false
		assert_equal(false, validate_isbn?(""))
	end

	# s is space
	def test_validate_pass_s_string_returns_false
		assert_equal(false, validate_isbn?(" "))
	end

	# d is dash
	def test_validate_pass_d_string_returns_false
		assert_equal(false, validate_isbn?("-"))
	end

	# valid isbn10
	# 7421394761
	def test_validate_pass_7421394761_returns_true
		assert_equal(true, validate_isbn?("7421394761"))
	end

end