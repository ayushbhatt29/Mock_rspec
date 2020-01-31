class Person

  def a
    sleep(3)
     'hello'
  end

end

RSpec.describe Person do

  describe 'regular double' do
    it 'can implement any method' do
      person=double(a:'hello',b: 20)
      expect(person.a).to eq('hello')
      expect(person.b).to eq(20)
    end
  end

  describe "instance double" do
    it "can only implement methods that are defined on the class " do
      person=instance_double(Person,a:'hello')
      expect(person.a).to eq('hello')
      #expect(person.b).to eq(20)
    end

    it "Another stricter method " do
      person=instance_double(Person)
      allow(person).to receive(:a).and_return('hello')
      expect(person.a).to eq('hello')
      #expect(person.b).to eq(20)
    end

  end
end
