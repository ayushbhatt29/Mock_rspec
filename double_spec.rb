RSpec.describe "double mocks" do

  it  "only allows defined methods to be invoked" do

=begin "this is for error" stuntman =double("Mr. danger")
       stuntman.fall_off_ladder
=end

    stuntman =double("Mr. danger",fall_off_ladder: 'ouch',light_on_fire: true)
    expect(stuntman.fall_off_ladder).to eq('ouch')
    expect(stuntman.light_on_fire).to eq(true)
  end

  it "only allows defined methods to be invoked using allow recieve method" do

    stuntman2=double("Mr. Khiladi")
    allow(stuntman2).to receive(:jump_from_plane)
    expect(stuntman2.jump_from_plane).to be_nil

  end

  it "only allows defined methods to be invoked using allow recieve and_return method" do

    stuntman2=double("Mr. Khiladi")
    allow(stuntman2).to receive(:jump_from_plane).and_return('lmao')
    expect(stuntman2.jump_from_plane).to eq('lmao')

  end

  it "only allows defined methods to be invoked using allow recieve_messages method" do

    stuntman2=double("Mr. Khiladi")
    allow(stuntman2).to receive_messages(jump_from_building: 'ouch', light_on_plane: false)
    expect(stuntman2.jump_from_building).to eq('ouch')
    expect(stuntman2.light_on_plane).to eq(false)

  end

end
