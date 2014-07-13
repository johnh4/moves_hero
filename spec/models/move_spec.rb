require 'rails_helper'
#require 'spec_helper'
require_relative '../mocks/move_mock'
require File.dirname(__FILE__) + "/../../app/models/move"

describe Move do
	before do
		token = ""
		#Moves::Client.stub(:new).with(token)
		@mock = MovesMock.new(token)
		allow(Moves::Client).to receive(:new).and_return(@mock)
		@moves = Move.new(token)
	end

	describe "step methods" do
		it "should calculate steps_today correctly" do
			expect(@moves.steps_today).to be(117)
		end
		it "should calculate month_steps correctly" do
			steps = [132,858,1652,117]
			expect(@moves.month_steps('2014-07')).to eq(steps)
		end
	end

	it "should calculate the month_days correctly" do
		days = ["7-09","7-10","7-11","7-12"]
		expect(@moves.month_days('2014-07')).to eq(days)
	end

	describe "summary methods" do
		it "should calculate walk_month_summary correctly" do
		wms = @moves.walk_month_summary('2014-07')
		expect(wms[0][:date]).to eq("20140709")
		expect(wms[3][:date]).to eq("20140712")
		expect(wms[1][:coins]).to eq(8580)
		expect(wms[2][:distance]).to eq(1079)
		end
	end
end
