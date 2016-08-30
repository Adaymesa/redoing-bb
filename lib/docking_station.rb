require_relative 'bike'

class DockingStation
  
  attr_accessor :bike

  def initialize
    @bikes = []
  end

	def release_bike
	  fail "No bikes available" if @bikes.empty?
	  @bikes.pop
	end

	def dock(bike)
	  fail "Docking station full" if @bikes.count >= 20
	  @bikes << bike
	end
end
