require 'josh_strscan'
require 'spec_helper'

describe JoshStrscan do
  subject { JoshStrscan.new 'abc def' }
  
  it 'is initialized with the string to scan' do
    -> { JoshStrscan.new 'abc def' }.should_not raise_error
  end
  
  describe '#eos?' do
    it 'returns false when there is content left in the string' do
      subject.eos?.should be false
    end
    
    it 'returns true when there is no content left in the string' do
      JoshStrscan.new('').eos?.should be true
    end
  end
  
  describe '#scan' do
    it 'receives a regex and returns the first match' do
      should find("abc").when_scanned_with(/\w+/)
    end
    
    it "returns nil when the regex doesn't match the beginning of the string" do
      should find(nil).when_scanned_with(/\s+/)
    end
    
    it 'remembers its place in the string' do
      should find("abc").when_scanned_with(/\w+/)
      should find(" ").when_scanned_with(/\s+/)
      should find("def").when_scanned_with(/\w+/)
    end
    
    it 'does not consume the original string' do
      string = "abc def"
      JoshStrscan.new(string).scan(/\w+/)
      string.should == 'abc def'
    end
  end
end