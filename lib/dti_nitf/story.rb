module DTI
  class Story
    attr_accessor :raw_xml
    
    def initialize(xml)
      raw_xml = DTI::NITF.parse(xml)
    end    
  end
end