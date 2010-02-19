dir = File.dirname(__FILE__)
%w[rubygems pp crack].each { |x| require x}
require File.join(dir, 'dti_nitf/nitf')
require File.join(dir, 'dti_nitf/story')

file_contents = File.read('/tmp/02/AIRPORT 021010.xml')
story = DTI::Story.new(file_contents)

pp story