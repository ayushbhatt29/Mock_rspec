class Actor
  def initialize(name)
    @name=name
  end

  def ready?
    sleep(3)
     true
    end

 def act
   puts "Its funny thing about coming home.Looks the same, feels the same.You'll realize what's changed is you"
 end

 def fall_off_ladder
   puts "call my agent! no way"
 end

 def light_on_fire
   false
 end
end

class Movie
  attr_reader :actor

  def initialize(actor)
    @actor=actor
  end

  def start_shooting
    if actor.ready?
      actor.act
      actor.act
      actor.fall_off_ladder
      actor.light_on_fire
      actor.light_on_fire
      actor.light_on_fire
    end
  end
end

#actor=Actor.new("Brad Pitt")
#movie=Movie.new(actor)
#movie.start_shooting

RSpec.describe Movie do
  let(:stuntman){ double("Mr.Danger", ready?: true, act: 'any string', fall_off_ladder: 'sure',light_on_fire: true)}
  subject{described_class.new(stuntman)}

  describe "Start shooting method" do

    it "expect actor to perform 3 tasks" do
=begin
      expect(stuntman).to receive(:ready?)
      expect(stuntman).to receive(:act)
      expect(stuntman).to receive(:fall_off_ladder)
      expect(stuntman).to receive(:light_on_fire)
=end
      #now checking recieve count
      expect(stuntman).to receive(:light_on_fire).exactly(3).times
      expect(stuntman).to receive(:fall_off_ladder).once
      expect(stuntman).to receive(:ready?).at_most(1).times
      expect(stuntman).to receive(:act).twice
      subject.start_shooting
    end
  end
end
