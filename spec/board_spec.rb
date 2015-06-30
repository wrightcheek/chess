require 'chess/board'

RSpec.describe Chess::Board do
  it 'converts between index and letter notations, without caring about strings or symbols' do
    expect(Chess::Board.to_indeces 'a1').to eq [0, 7]
    expect(Chess::Board.to_indeces 'h1').to eq [7, 7]
    expect(Chess::Board.to_indeces 'a8').to eq [0, 0]
    expect(Chess::Board.to_indeces 'h8').to eq [7, 0]

    expect(Chess::Board.to_indeces :h8).to eq [7, 0]
  end
end
