module HomeHelper
	def coins_today(user)
		user.steps_today * 10
	end

	def coins_this_month(user)
		user.steps_month * 10
	end

	def short_date(date)
		with_zero = date.gsub(/\d{4}(\d{2})(\d{2})/,'\1-\2')
		with_zero.gsub(/^0/,'')
	end

	def meters_to_miles(meters)
		(meters * 0.000621371).round(2)
	end
end
