class MovesMock
	def initialize(token)
	end
	def daily_summary(timeframe = nil)
		 if timeframe.blank?
			 [{"date"=>"20140712", "summary"=>[{"activity"=>"walking", "group"=>"walking", 
			 	 "duration"=>99.0, "distance"=>61.0, "steps"=>117}], "lastUpdate"=>"20140712T215426Z"}]
		 else
[{"date"=>"20140709", "summary"=>[{"activity"=>"transport", "group"=>"transport", "duration"=>617.0, "distance"=>9097.0}, {"activity"=>"walking", "group"=>"walking", "duration"=>60.0, "distance"=>66.0, "steps"=>132}], "lastUpdate"=>"20140710T061959Z"}, {"date"=>"20140710", "summary"=>[{"activity"=>"walking", "group"=>"walking", "duration"=>634.0, "distance"=>523.0, "steps"=>858}, {"activity"=>"transport", "group"=>"transport", "duration"=>780.0, "distance"=>8903.0}], "lastUpdate"=>"20140711T130118Z"}, {"date"=>"20140711", "summary"=>[{"activity"=>"transport", "group"=>"transport", "duration"=>1556.0, "distance"=>11967.0}, {"activity"=>"walking", "group"=>"walking", "duration"=>1284.0, "distance"=>1079.0, "steps"=>1652}], "lastUpdate"=>"20140712T215426Z"}, {"date"=>"20140712", "summary"=>[{"activity"=>"walking", "group"=>"walking", "duration"=>99.0, "distance"=>61.0, "steps"=>117}], "lastUpdate"=>"20140712T215426Z"}, {"date"=>"20140713", "summary"=>nil}]
		 end
	end
end
