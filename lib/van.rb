require_relative 'docking_station'
require_relative 'garage'

class Van

	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def collect_broken_bikes(station)
		@bikes = station.bikes.select{|bike| bike.broken?}
		station.remove_broken_bikes
	end

	def deliver_broken_bikes(garage)
   	garage.receive_broken(bikes)
	end

  def remove_broken_bikes
    @bikes = @bikes.reject{|bike| bike.broken?}
  end
end