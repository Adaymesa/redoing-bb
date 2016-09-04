require_relative 'van'

class Garage

	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def receive_broken(van)
		@bikes = van.bikes.select{|bike| bike}
		van.remove_broken_bikes
  end

  # def fix(broken_bikes)
  #   broken_bikes.each do |bike|
  #   bike.broken = false
  # 	end
  # end
end
