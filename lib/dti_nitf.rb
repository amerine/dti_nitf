dir = File.dirname(__FILE__)
%w[rubygems crack].each { |x| require x}
require File.join(dir, 'dti_nitf/nitf')
require File.join(dir, 'dti_nitf/story')

# require 'pp'
# 
# file_contents = File.read('/tmp/02/a1oly-luge 021410.xml')
# story = DTI::Story.new(file_contents)
# 
# pp story.paper