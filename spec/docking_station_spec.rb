require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }  

  it { is_expected.to respond_to(:bike) }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks something' do 
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end
