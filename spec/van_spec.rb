require 'bike'
require 'docking_station'
require 'van'

describe Van do
	
	describe '#Pick up broken bikes' do
		it 'picks up broken bikes from Docking_station' do
			bike = Bike.new
			docking_station = DockingStation.new
			bike.report_broken
			docking_station.dock(bike)
			
			expect(subject.collect(broken_bike).to be broken_bike)
		end

	end

end