require 'docking_station'
require 'bike'

describe DockingStation do  

  describe '#initialization' do
    
    let(:bike) { Bike.new }
    
    it 'defaults capacity' do
      subject.capacity.times { subject.dock(bike) }
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end

    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(bike) }
      expect{ docking_station.dock(bike) }.to raise_error 'Docking station full'
    end
  end


  describe '#release_bike' do

    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_working
    end
    
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'should not release a bike if the bike is broken' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect(subject.release_bike).not_to eq bike

    end
  end

  describe '#dock' do 

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to include(bike)
    end
    
    it 'raises an error when the dock station is full and trying to dock' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
end
