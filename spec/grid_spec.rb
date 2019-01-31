RSpec.describe Grid do
  context 'grid initializes' do
    it 'exists' do
      expect(subject.hori).to eq(5)
      expect(subject.verti).to eq(5)
    end
  end

  context 'valid move?' do
    it 'has a valid move' do
      expect(subject.valid_move?(3, 2)).to eq(true)
    end

    it 'has an invalid move' do
      expect(subject.valid_move?(7, 2)).to eq(false)
    end
  end
end
