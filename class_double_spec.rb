class Deck
  def self.build

  end
end

  class Cardgame
    attr_reader :cards

    def start
      @cards=Deck.build
    end

  end

  RSpec.describe Cardgame do

    it ' can only implement class method that are defined on class ' do
    class_double(Deck,build:['Ace','Queen'])
# when deck class is not defined then use class_double('Deck',build:['Ace','Queen'])
    deck_class=class_double(Deck,build:['Ace','Queen']).as_stubbed_const

    expect(deck_class).to receive(:build)
    subject.start
    expect(subject.cards).to eq(['Ace','Queen'])
      end

  end
