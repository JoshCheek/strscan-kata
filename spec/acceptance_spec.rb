require 'josh_strscan'
require 'spec_helper'

describe 'Acceptance spec' do
  it 'implements the interface shown in the StringScanner docs' do
    s = JoshStrscan.new('This is an example string')
    s.eos?.should be false

    s.should find("This").when_scanned_with(/\w+/)
    s.should find(nil   ).when_scanned_with(/\w+/)
    s.should find(" "   ).when_scanned_with(/\s+/)
    s.should find(nil   ).when_scanned_with(/\s+/)
    s.should find("is"  ).when_scanned_with(/\w+/)
    s.eos?.should be false

    s.should find(" "      ).when_scanned_with(/\s+/)
    s.should find("an"     ).when_scanned_with(/\w+/)
    s.should find(" "      ).when_scanned_with(/\s+/)
    s.should find("example").when_scanned_with(/\w+/)
    s.should find(" "      ).when_scanned_with(/\s+/)
    s.should find("string" ).when_scanned_with(/\w+/)
    s.eos?.should be true

    s.should find(nil).when_scanned_with(/\s+/)
    s.should find(nil).when_scanned_with(/\w+/)
  end
end