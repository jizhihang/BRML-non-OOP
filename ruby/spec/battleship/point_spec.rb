require 'spec_helper'

describe Battleship::Point do
  describe '#off_table?' do
    it 'returns true when off the table' do
      table = instance_double('Battleship::Table', row_length: 5, col_length: 5)
      bp = Battleship::Point.new(row: 8, col: 2, table: table)
      expect(bp).to be_off_table
    end
  end

  describe '#to_s' do
    it 'returns (row, col)' do
      bp = Battleship::Point.new(row: 1, col: 2)
      expect(bp.to_s).to eq "(1,2)"
    end
  end

  describe '#row' do
    it 'should return the row' do
      bp = Battleship::Point.new(row: 1, col: 2)
      expect(bp.row).to eq 1
    end
  end

  describe '#col' do
    it 'should return the col' do
      bp = Battleship::Point.new(row: 1, col: 2)
      expect(bp.col).to eq 2
    end
  end

  describe '#miss!' do
    it 'sets the state of the point to :miss' do
      bp = Battleship::Point.new(row: 1, col: 2)
      bp.miss!

      expect(bp).to be_missed
    end
  end

  describe '#same_as?(point)' do
    it 'should be true if point has the same coordinates as the given point' do
      bp = Battleship::Point.new(row: 1, col: 2)
      expect(bp.same_as?(bp)).to eq true
    end
  end

  describe '#hit!' do
    it 'sets the state of the point to :hit' do
      bp = Battleship::Point.new(row: 1, col: 2)
      bp.hit!

      expect(bp).to be_hit
    end
  end

  it 'should be untried at first' do
    bp = Battleship::Point.new(row: 1, col: 2)
    expect(bp).to be_untried
  end

  it 'can be initialized to being missed' do
    bp = Battleship::Point.new(row: 1, col: 2, state: :missed)
    expect(bp).to be_missed
  end
end