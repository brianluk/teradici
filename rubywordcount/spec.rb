require_relative './topten'

describe '#sanitize' do
  it 'should remove punctuation' do
    expect(sanitize('test!')).to eq 'test'
  end
  it 'should normalize to lowercase' do
    expect(sanitize('Test!')).to eq 'test'
  end
end

describe '#break_line' do
  it 'should count words in a string of text' do
    expected = {"this"=>2, "is"=>1, "a"=>1, "test"=>2}
    expect(break_line("This is a test THIS! TEST!")).to eq expected
  end
end

describe '#topten' do
  it 'should sort the hash by top values' do
    expected = {"this"=>2, "test"=>2, "is"=>1, "a"=>1}
    expect(topten({"this"=>2, "is"=>1, "a"=>1, "test"=>2})).to eq expected
  end
  it 'should return only top ten results' do
    expected = {"eleven"=>11, "ten"=>10, "nine"=>9, "eight"=>8, "seven"=>7, "six"=>6, "five"=>5, "four"=>4, "three"=>3, "two"=>2}
    expect(topten({"eleven"=>11, "ten"=>10, "nine"=>9, "eight"=>8, "seven"=>7, "six"=>6, "five"=>5, "four"=>4, "three"=>3, "two"=>2, "one"=>1})).to eq expected
  end
end
