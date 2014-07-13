class Move
	include ActiveModel::Model
	include HomeHelper
	def initialize(access_token)
		@moves = Moves::Client.new(access_token)
	end

	def steps_today
		@moves.daily_summary[0]['summary'].find { |a| a['group'] == 'walking' }['steps']
	end
	def daily_summary(timeframe = nil)
		timeframe.nil? ? @moves.daily_summary : @moves.daily_summary(timeframe)
	end

	def month_summary(month = current_month)
		month ||= Date.today.strftime("%Y-%m")
		@moves.daily_summary(month)
	end

	#returns array of steps for specified month
	def month_steps(month = current_month)
		month_sum = month_summary(month)
		month_steps = []
		month_sum.each do |day|
			unless day['summary'].nil?
				details = day['summary'].find { |a| a['group'] == 'walking' }
				month_steps << details['steps']
			end
		end
		month_steps
	end

	#returns array of dates with data for specified month
	def month_days(month = current_month)
		month_sum = month_summary(month)
		month_days = []
		month_sum.each { |day| month_days << short_date(day['date']) unless day['summary'].nil? }
		month_days
	end
	
	#returns returns an array, each element representing a day of walk data
	#each element being a hash, keys being steps, distance, coins, and date
	def walk_month_summary(month = current_month)
		month_sum = month_summary(month)
		this_month = []
		month_sum.each do |day|
			unless day['summary'].nil?
				details = day['summary'].find { |a| a['group'] == 'walking' }
				this_day = { steps: details['steps'], distance: details['distance'],
										 coins: details['steps'] * 10, date: day['date']}
				this_month << this_day
			end
		end
		this_month
	end
	def profile
		@moves.profile
	end
	protected

		def current_month
			Date.today.strftime("%Y-%m")
		end
end
