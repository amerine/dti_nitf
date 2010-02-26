dir = File.dirname(__FILE__)
%w[rubygems crack].each { |x| require x}
require File.join(dir, 'dti_nitf/nitf')
require File.join(dir, 'dti_nitf/story')