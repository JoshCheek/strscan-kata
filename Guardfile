# note that I hacked guard-rspec a bit to make it behave like I wanted in the video
guard 'rspec', :cli => "--color --format nested --fail-fast --drb" do
  watch('lib/josh_strscan.rb')        { 'spec/josh_strscan_spec.rb' }
  watch('spec/spec_helper.rb')        { 'spec' }
  watch('spec/acceptance_spec.rb')    { 'spec/acceptance_spec.rb' }
  watch('spec/josh_strscan_spec.rb')  { 'spec/josh_strscan_spec.rb' }
end
