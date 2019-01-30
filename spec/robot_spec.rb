require_relative './robot'

RSpec.describe Robot do
  before(:each) do 
    @a = Robot.new
  end

  it 'initialized at (0,0)' do
    expect(@a.report).to eq("Robot is currently at (0, 0) and it's facing NORTH")
  end

  it 'resets place' do
    @a.place(3,2,'SOUTH')
    expect(@a.report).to eq("Robot is currently at (3, 2) and it's facing SOUTH")
  end

  it 'moves' do
    @a.move
    expect(@a.report).to eq("Robot is currently at (0, 1) and it's facing NORTH")
  end

  it 'turns left' do 
    @a.left
    expect(@a.report).to eq("Robot is currently at (0, 0) and it's facing WEST")
  end

  it 'turns right' do 
    @a.right
    expect(@a.report).to eq("Robot is currently at (0, 0) and it's facing EAST")
  end

  # context 'ignores moves off board' do
  #   it 'ignore moves if it goes negative' do
  #     @a.place(0,0,"WEST")
  #     @a.move
  #     expect(@a.report).to eq("Robot is currently at (0, 0) and it's facing WEST")
  #   end

    # it 'ignore moves if it goes over grid 4' do
    #   @a.place(5,2,"NORTH")
    #   expect(@a.report).to eq("Robot is currently at (0, 0) and it's facing NORTH")
    # end
  # end
end