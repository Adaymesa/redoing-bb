require 'bike'
require 'docking_station'
require 'van'

describe Van do

	let(:workingbike){double("workingbike", :broken? => false)}
  let(:broken_bike){double("broken_bike", :broken? => true)}
  let(:station){double("station", :bikes => [broken_bike, workingbike], :remove_broken_bikes => [workingbike] )}
  let(:garage){double("garage", :receive_broken => [broken_bike])}

  it 'should store broken bikes from station' do
    subject.collect_broken_bikes(station)
    expect(subject.bikes).to eq [broken_bike]
  end

  it 'should remove broken bikes from the station' do
    expect(station).to receive(:remove_broken_bikes)
    subject.collect_broken_bikes(station)
  end

  it 'should deliver broken bikes in the garage' do 
		subject.collect_broken_bikes(station)
    subject.deliver_broken_bikes(garage)
    expect(subject.bikes.length).to eq 0
	end
end