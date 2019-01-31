require_relative '../lib/robot'

RSpec.describe Robot do
  before(:each) do
    @a = Robot.new
  end
  context 'testing all robot commands' do
    it 'initialized at (0,0)' do
      report_line = "Robot is currently at (0, 0) and it's facing NORTH"
      expect(@a.report).to eq(report_line)
    end

    it 'resets place' do
      @a.place(3, 2, 'SOUTH')
      report_line = "Robot is currently at (3, 2) and it's facing SOUTH"
      expect(@a.report).to eq(report_line)
    end

    it 'moves' do
      @a.move
      report_line = "Robot is currently at (0, 1) and it's facing NORTH"
      expect(@a.report).to eq(report_line)
    end

    it 'turns left' do
      @a.left
      report_line = "Robot is currently at (0, 0) and it's facing WEST"
      expect(@a.report).to eq(report_line)
    end

    it 'turns right' do
      @a.right
      report_line = "Robot is currently at (0, 0) and it's facing EAST"
      expect(@a.report).to eq(report_line)
    end

    it 'reports' do
      @a.report
      report_line = "Robot is currently at (0, 0) and it's facing NORTH"
      expect(@a.report).to eq(report_line)
    end
  end

  context 'testing position commands' do
    it 'tests current position' do
      expect(@a.current_position).to eq([0, 0, 'NORTH'])
    end
    it 'tests next position' do
      expect(@a.next_position).to eq([0, 1])
    end
  end
end
