require_relative './app'
require_relative './grid'
require_relative './robot'

RSpec.describe App do
  before(:each) do 
    @app = App.new
  end

  it "returns PLACE method" do
    line = "PLACE 1,2,NORTH"
    binding.pry
    expect(@app.translate(line)).to eq([1,2,"NORTH"])
  end
  it "return MOVE method" do
    line = "MOVE"
    expect(@app.translate(line)).to eq([0,1,"NORTH"])
  end

end
