require 'spec_helper'

describe ToyRobot::Robot do
  let(:subject) { ToyRobot::Robot.new }

  before do
    subject.place! 0, 0, 'north'
  end

  describe '#place!' do
    context 'when coordinates are valid' do
      it 'places robot on the coordinates' do
        expect(subject.x).to eq(0)
        expect(subject.y).to eq(0)
      end

      it 'sets the given direction' do
        expect(subject.direction).to eq('north')
      end
    end

    context 'when coordinates are out of bounds' do
      it 'does not move the robot' do
        subject.place!(-1, -1, 'north')
        expect(subject.x).to eq 0
        expect(subject.y).to eq 0
      end
    end
  end

  describe '#move!' do
    context 'facing valid coordinates' do
      before do
        subject.move!
      end

      it 'moves forward' do
        expect(subject.x).to eq 0
        expect(subject.y).to eq 1
      end

      it 'does not change direction' do
        expect(subject.direction).to eq 'north'
      end
    end

    context 'when facing an edge' do
      before do
        subject.place! 0, 4, 'north'
        subject.move!
      end

      it 'does not move the robot' do
        expect(subject.x).to eq 0
        expect(subject.y).to eq 4
        expect(subject.direction).to eq 'north'
      end
    end
  end

  describe '#left!' do
    it 'turns left' do
      subject.left!
      expect(subject.direction).to eq 'west'
      subject.left!
      expect(subject.direction).to eq 'south'
      subject.left!
      expect(subject.direction).to eq 'east'
      subject.left!
      expect(subject.direction).to eq 'north'
    end
  end

  describe '#right!' do
    it 'turns right' do
      subject.right!
      expect(subject.direction).to eq 'east'
      subject.right!
      expect(subject.direction).to eq 'south'
      subject.right!
      expect(subject.direction).to eq 'west'
      subject.right!
      expect(subject.direction).to eq 'north'
    end
  end
end
