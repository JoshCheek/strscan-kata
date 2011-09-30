class JoshStrscan
  attr_accessor :string
  
  def initialize(string)
    self.string = string.dup
  end
  
  def eos?
    string.empty?
  end
  
  def scan(regex)
    match = string[regex]
    if string.start_with? match
      string.sub! match, ''
      match
    end
  end
end