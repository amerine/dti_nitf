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
      #pp cracked
      
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
      
      self.publication = pub_data["name"].rstrip
      self.section = pub_data["position.section"].rstrip
      self.pub_date = pub_data["date.publication"].rstrip
      self.page = pub_data["position.sequence"].rstrip.to_i
      
      self.body = join_hash(doc_body["body.content"]["p"])
      self.body = fix_quotes(self.body)
      
      if !self.correction?
        self.byline = doc_body["body.head"]["byline"]["person"].gsub!(/^By\s/, '').rstrip if doc_body["body.head"]["byline"]
        self.paper = doc_body["body.head"]["byline"]["byttl"].rstrip if doc_body["body.head"]["byline"]
        self.hl1 = doc_body["body.head"]["hedline"]["hl1"].to_s.rstrip if doc_body["body.head"]["hedline"]     
        if doc_body["body.head"]["hedline"] && doc_body["body.head"]["hedline"]["hl2"]
          self.hl2 = doc_body["body.head"]["hedline"]["hl2"].to_s.lstrip.rstrip
        end
        self.tagline = doc_body["body.end"]["tagline"].to_s.lstrip.rstrip if doc_body["body.end"]
      end
    end    
    
    def correction?
      self.correction
    end
    
    def join_hash(hash)
      hash_string =""
      hash.each { |h|
        hash_string << "<p>#{h}</p>"
      }
      return hash_string
    end
    
    def fix_quotes(string)
      string.gsub! "\342\200\230", "'"
      string.gsub! "\342\200\231", "'"
      string.gsub! "\342\200\234", '"'
      string.gsub! "\342\200\235", '"'
      string
    end
  end
end