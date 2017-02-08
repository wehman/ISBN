# Group Members: 
# Matt Teitz @mwteitz
# Frank Mugo @Frankmugo
# Mike Ciletti @michaelciletti
# Pat Wehman @wehman

require "minitest/autorun"
require_relative "isbn_number.rb"

class TestISBNNumber < Minitest::Test

	def test_rwad_pass_0d321d14653d0_returns_0321146530
		assert_equal("0321146530", remove_whitespaces_and_dashes("0-321-14653-0"))
	end

	def test_rwad_pass_0s321s14653s0_returns_0321146530
		assert_equal("0321146530", remove_whitespaces_and_dashes("0 321 14653 0"))
	end

	def test_rwad_pass_0s3d21s14d653s0d_returns_0321146530
		assert_equal("0321146530", remove_whitespaces_and_dashes("0 3-21 14-653 0-"))
	end

	def test_and_pass_1919fdjksl3_return_false
		assert_equal(false, all_numeric_digits?("1919fdjksl3"))
	end

	def test_and_pass_0123456789_return_true
		assert_equal(true, all_numeric_digits?("0123456789"))
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