require 'spec_helper'

describe ToyRobot::FileReader do
  context 'when file does not exist' do
    it 'raises an error' do
      expect { ToyRobot::FileReader.process_file }.to raise_error(ArgumentError)
    end
  end
end
