RSpec.describe 'allow method review' do
  it 'can custamize return value for methods' do
    calculator=double
    allow(calculator).to receive(:add).and_return(15)
    expect(calculator.add).to eq(15)
    expect(calculator.add(1,2,3,4,5,6,6,8)).to eq(15)
  end

  it 'can stub one or more methods on real objects' do
    arr=[1,2,3]
    expect(arr.sum).to eq(6)
    arr=[1,2,4]
    allow(arr).to receive(:sum).and_return(10)
    expect(arr.sum).to eq(10)
  end

  it 'can return multiple return values in sequence' do
    mock_array=double
    allow(mock_array).to receive(:pop).and_return(:c,:b,nil)
    expect(mock_array.pop).to eq(:c)
    expect(mock_array.pop).to eq(:b)
    expect(mock_array.pop).to be_nil
  end
end
