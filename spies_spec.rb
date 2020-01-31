RSpec.describe 'spies' do
  let(:animal){spy('animal')}

  it 'confirms that a message has been received' do
    animal.eat_food
    expect(animal).to have_received(:eat_food)
    expect(animal).not_to have_received(:eat_human)
  #  expect(animal).to have_received(:eat_human)
  end

  it 'retains the same functionality as regular double' do
    animal.eat_food
    animal.eat_food
    expect(animal).to have_received(:eat_food).exactly(2).times
  end
end
