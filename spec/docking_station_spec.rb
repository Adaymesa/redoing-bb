require 'docking_station'
require 'bike'

describe DockingStation do  

   it { is_expected.to respond_to :bike }

  describe '#release_bike' do

    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_working
    end
    
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do 

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to include(bike)
    end
    
    it 'raises an error when the dock station is full and trying to dock' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
end
