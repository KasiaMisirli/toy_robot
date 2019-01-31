require_relative './grid'

RSpec.describe Grid do
  before(:each) do
    @grid = Grid.new
  end

  context 'grid initializes' do
    it 'exists' do
      expect(@grid.hori).to eq(5)
      expect(@grid.verti).to eq(5)
    end
  end

  context 'valid move?' do
    it 'has a valid move' do
      expect(@grid.valid_move?(3, 2)).to eq(true)
    end

    it 'has an invalid move' do
      expect(@grid.valid_move?(7, 2)).to eq(false)
    end
  end
end
