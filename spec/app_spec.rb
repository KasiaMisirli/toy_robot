require_relative '../lib/app'
require_relative '../lib/grid'
require_relative '../lib/robot'

RSpec.describe App do
  before(:each) do
    @app = App.new
  end
  context 'translates commands' do
    it 'translates PLACE command' do
      line = 'PLACE 1,2,NORTH'
      expect(@app.translate(line)).to eq([1, 2, 'NORTH'])
    end

    it 'translates MOVE command' do
      line = 'MOVE'
      expect(@app.translate(line)).to eq([0, 1, 'NORTH'])
    end

    it 'translates LEFT command' do
      line = 'LEFT'
      expect(@app.translate(line)).to eq([0, 0, 'WEST'])
    end

    it 'translates RIGHT command' do
      line = 'RIGHT'
      expect(@app.translate(line)).to eq([0, 0, 'EAST'])
    end

    it 'translates REPORT command' do
      line = 'REPORT'
      report_line = "Robot is currently at (0, 0) and it's facing NORTH"
      expect(@app.translate(line)).to eq(report_line)
    end
  end

  context 'it ignores invalid commands' do
    it 'ignores invalid PLACE command' do
      line = 'PLACE 5,3,NORTH'
      expect(@app.translate(line)).to eq([0, 0, 'NORTH'])

      line2 = 'PLACE -2,3,NORTH'
      expect(@app.translate(line2)).to eq([0, 0, 'NORTH'])
    end

    it 'ignores mixed case commands' do
      line = 'PLACE 3,2,NORTH'.downcase
      expect(@app.translate(line)).to eq([0, 0, 'NORTH'])

      line2 = 'Place 1,3,NORTH'
      expect(@app.translate(line2)).to eq([0, 0, 'NORTH'])
    end

    it 'ignores invalid MOVE command' do
      place_command = 'PLACE 0,0,WEST'
      line = 'MOVE'
      @app.translate(place_command)
      expect(@app.translate(line)).to eq([0, 0, 'WEST'])
    end
  end
end
