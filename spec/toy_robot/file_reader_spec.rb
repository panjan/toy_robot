require 'spec_helper'

describe ToyRobot::FileReader do
  let(:subject) { ToyRobot::FileReader }

  describe '#process_file' do
    context 'when file does not exist' do
      it 'raises an error' do
        expect { subject.process_file }
          .to raise_error ArgumentError
      end
    end

    context 'when file exists' do
      let(:file) { ['PLACE 0,0,NORTH', 'MOVE', 'LEFT', 'RIGHT', 'REPORT'] }

      before do
        allow(File).to receive(:file?).and_return true
        allow(File).to receive(:readlines).with(an_instance_of(String)).and_return file
      end

      it 'executes each command' do
        expect(ToyRobot::Controller)
          .to receive(:do)
          .exactly(5).times
        subject.process_file 'foo'
      end
    end
  end
end
