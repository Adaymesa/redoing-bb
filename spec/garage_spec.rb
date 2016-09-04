require 'garage'
require 'van'

describe Garage do

	let(:workingbike){double("workingbike", :broken? => false)}
  let(:broken_bike){double("broken_bike", :broken? => true)}
  let(:van){double("van", :bikes => [broken_bike], :remove_broken_bikes => [workingbike] )}
	
	it 'receives bikes' do
    subject.receive_broken(van)
    expect(subject.bikes).to eq [broken_bike]
  end
end