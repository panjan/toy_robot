require 'spec_helper'

describe ToyRobot::Controller do
  let(:subject) { ToyRobot::Controller }

  describe '#do' do
    context 'when command is place' do
      it 'calls place! with correct arguments' do
        expect(subject.robot)
          .to receive(:place!).with(0, 0, 'south')
        subject.do('PLACE 0,0,SOUTH')
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
