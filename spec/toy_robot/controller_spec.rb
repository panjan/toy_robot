require 'spec_helper'

describe ToyRobot::Controller do
  let(:subject) { ToyRobot::Controller }

  describe '#do' do
    context 'when command is place' do
      before do
        expect(subject.robot)
          .to receive(:place!).with(0, 0, 'south')
      end

      it 'calls place! with correct arguments' do
        subject.do('PLACE 0,0,SOUTH')
      end

      it 'works with spaces in the middle' do
        subject.do('  PLACE  0 , 0,  SOUTH ')
      end
    end

    %w(move left right).each do |cmd|
      context "when command is #{cmd}" do
        it "calls #{cmd}! on Robot" do
          expect(subject.robot).to receive("#{cmd}!")
          subject.do(cmd)
        end
      end
    end
  end
end
