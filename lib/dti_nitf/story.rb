module DTI
  class Story
    attr_accessor :raw_xml, :doc_id, :copyright_holder, :doc_name
    attr_accessor :publication, :section, :pub_date, :page
    attr_accessor :body, :byline, :paper, :hl1, :hl2, :tagline
    attr_accessor :correction, :original_story_id
    
    def initialize(xml)
      self.raw_xml = DTI::NITF.parse(xml)
      self.correction = false
      
      cracked = Crack::XML.parse(self.raw_xml)
      if cracked["nitf"]['head']['original_storyid']
        self.correction = true 
        self.original_story_id = cracked["nitf"]['head']['original_storyid'].to_i
        self.hl1 = "Correction"
      end
      
      doc_data = cracked["nitf"]["head"]["docdata"]
      pub_data = cracked["nitf"]["head"]["pubdata"]
      doc_body = cracked["nitf"]["body"]
      
      self.doc_id = doc_data["doc_id"]["id_string"].to_i
      self.copyright_holder = doc_data["doc.copyright"]["holder"]
      self.doc_name = doc_data["doc_name"]["name_string"]
      
      if !pub_data.nil?
        self.section = pub_data["position.section"].strip
        self.pub_date = pub_data["date.publication"].strip
        self.page = pub_data["position.sequence"].strip.to_i
        self.publication = pub_data["name"].strip
      end
      
      if !doc_body["body.content"].nil? and !doc_body["body.content"]["p"].nil?
        self.body = doc_body["body.content"]["p"].collect{|d| "<p>#{d.to_s.strip}</p>"}.join
        if self.body.length < 30
          self.body = doc_body["body.content"].collect{|d| "<p>#{d.to_s.strip}</p>"}.join
        end
        self.body = fix_escaped_elements(self.body)
      end
      
      if !self.correction?
        self.byline = doc_body["body.head"]["byline"]["person"].to_s.rstrip.gsub(/^By\s/, '') if doc_body["body.head"]["byline"]
        if !doc_body["body.head"]["byline"].nil?
          self.paper = doc_body["body.head"]["byline"]["byttl"].to_s.strip if doc_body["body.head"]["byline"]["byttl"]
        end
        self.hl1 = doc_body["body.head"]["hedline"]["hl1"].to_s.chomp.strip.gsub(/\n/,'') if doc_body["body.head"]["hedline"]     
        if doc_body["body.head"]["hedline"] && doc_body["body.head"]["hedline"]["hl2"]
          self.hl2 = doc_body["body.head"]["hedline"]["hl2"].to_s.lstrip.rstrip
        end
        self.tagline = doc_body["body.end"]["tagline"].to_s.lstrip.rstrip if doc_body["body.end"]
      end
    end    
    
    def correction?
      self.correction
    end
    
    def fix_escaped_elements(string)
      return_string = string
      return_string.gsub! /\342\200[\230\231]/, "'"
      return_string.gsub! /\342\200[\234\235]/, '"'
      return_string
    end
  end
end