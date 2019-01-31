require_relative '../lib/robot'

RSpec.describe Robot do
  context 'testing all robot commands' do
    it 'initialized at (0,0)' do
      report_line = "Robot is currently at (0, 0) and it's facing NORTH"
      expect(subject.report).to eq(report_line)
    end

    it 'resets place' do
      subject.place(3, 2, 'SOUTH')
      report_line = "Robot is currently at (3, 2) and it's facing SOUTH"
      expect(subject.report).to eq(report_line)
    end

    it 'moves' do
      subject.move
      report_line = "Robot is currently at (0, 1) and it's facing NORTH"
      expect(subject.report).to eq(report_line)
    end

    it 'turns left' do
      subject.left
      report_line = "Robot is currently at (0, 0) and it's facing WEST"
      expect(subject.report).to eq(report_line)
    end

    it 'turns right' do
      subject.right
      report_line = "Robot is currently at (0, 0) and it's facing EAST"
      expect(subject.report).to eq(report_line)
    end

    it 'reports' do
      subject.report
      report_line = "Robot is currently at (0, 0) and it's facing NORTH"
      expect(subject.report).to eq(report_line)
    end
  end

  context 'testing position commands' do
    it 'tests current position' do
      expect(subject.current_position).to eq([0, 0, 'NORTH'])
    end
    
    it 'tests next position' do
      expect(subject.next_position).to eq([0, 1])
    end
  end
end
