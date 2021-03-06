def print_song(no_of_bottles)

	if no_of_bottles < 0
		puts 'Please enter a number that isn\'t negative.'
	end

	until no_of_bottles == 0
		if no_of_bottles > 1
			puts "#{english_number(no_of_bottles)} bottles of beer on the wall,"
			puts "#{english_number(no_of_bottles)} bottles of beer,"
		else
			puts "#{english_number(no_of_bottles)} bottle of beer on the wall,"
			puts "#{english_number(no_of_bottles)} bottle of beer,"
		end

		puts "Take one down, pass it around,"
		puts "#{english_number(no_of_bottles - 1)} bottles of beer on the wall." if @no_of_bottles != 2
		puts "#{english_number(no_of_bottles - 1)} bottle of beer on the wall." if @no_of_bottles == 2

		no_of_bottles -= 1
	end
end

def english_number(number)

	if number == 0
		return 'zero'
	end

	return_string = '' # This is the string we will return.
	ones_place = ['one', 'two', 'three', 'four', 'five', 'six','seven', 'eight', 'nine']
	tens_place = ['ten', 'twenty', 'thirty','forty', 'fifty', 'sixty','seventy', 'eighty', 'ninety']
	teenagers = ['eleven', 'twelve', 'thirteen','fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
	
	
	# Code to catch the high numbers (i.e. any thing over 1,000)

	higher_places = {10**48=>' quindecillion', 10**45=>' quattuordecillion', 
		10**42=>' tredecillion', 10**39=>' duodecillion', 10**36=>' undecillion', 
		10**33=>' decillion', 10**30=>' nonillion', 10**27=>' octillion', 
		10**24=>' septillion', 10**21=>' sextillion', 10**18=>' quintillion', 
		10**15=>' quadrillion', 10**12=>' trillion', 10**9=>' billion', 
		10**6=>' million', 10**3=>' thousand'}
	
	if number >= 1000
		higher_places.each do |key, value|
			if number >= key
				multiplier = number / key
				number -= (multiplier * key)
				return_string += english_number(multiplier) + value
				return_string += ' ' if number > 0
			end
		end
	end

	# Code to catch the hundreds

	multiple = number/100
	number = number - multiple * 100
	if multiple > 0
		hundreds = english_number(multiple)
		return_string = return_string + hundreds + ' hundred'

		if number > 0
			return_string = return_string + ' '
		end
	end

	# Code to catch the tens

	multiple = number/10 
	number = number - multiple * 10 

	if multiple > 0
		if ((multiple == 1) and (number > 0))
			return_string = return_string + teenagers[number - 1]
			number = 0
		else
			return_string = return_string + tens_place[multiple - 1]
		end
		if number > 0
			return_string = return_string + '-'
			dash = true
		end
	end

	# Code to catch the ones

	multiple = number
	number = 0 
	if multiple > 0
		return_string = return_string + ones_place[multiple - 1]
	end
	return_string

end

print_song(9999)