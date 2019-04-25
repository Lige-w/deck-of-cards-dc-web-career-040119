require 'pry'

class Deck

  attr_reader :cards

  def initialize()
    @cards = Card.suits.map do |suit|
      Card.ranks.map { |rank| Card.new(suit, rank) }
    end.flatten
  end

  def choose_card
    chosen = cards.sample
    cards.delete_if { |card| card == chosen }
    chosen
  end
end

class Card

  attr_reader :suit, :rank

  @@all = []

  def initialize(suit, rank)
    @rank = rank
    @suit = suit
  end

  def self.suits
    ["hearts", "spades", "clubs", "diamonds"]
  end

  def self.ranks
    ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
  end

  def self.all
    @@all
  end
end