  require 'bike'

  describe Bike do
    it { is_expected.to respond_to :working? }
    it { is_expected.to respond_to :report_broken }
    it { is_expected.to respond_to :broken? }

    describe '#report_broken' do
      it 'should give the bike a broken attribute' do
       expect(subject.broken?).to eq false
       subject.report_broken
       expect(subject.broken?).to eq true
      end

      it 'should set the bike to not working' do
       expect(subject.working?).to eq true
       subject.report_broken
       expect(subject.working?).to eq false
      end
    end
  end

