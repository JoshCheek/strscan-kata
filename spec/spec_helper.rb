RSpec::Matchers.define :find do |expected|
  match do |scanner|
    scanner.scan(@regex) == expected
  end
  
  def when_scanned_with(regex)
    @regex = regex
    self
  end
end