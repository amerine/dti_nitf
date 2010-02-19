module DTI
  class Story
    attr_accessor :raw_xml, :doc_id, :copyright_holder, :doc_name
    attr_accessor :publication, :section, :pub_date, :page
    attr_accessor :body, :byline, :paper, :hl1, :hl2, :tagline
    
    def initialize(xml)
      self.raw_xml = DTI::NITF.parse(xml)
      
      cracked = Crack::XML.parse(self.raw_xml)
      #pp cracked
      
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
      
      self.byline = doc_body["body.head"]["byline"]["person"].gsub!(/^By\s/, '').rstrip!
      self.paper = doc_body["body.head"]["byline"]["byttl"].rstrip!
      self.hl1 = doc_body["body.head"]["hedline"]["hl1"].to_s.rstrip
      self.hl2 = doc_body["body.head"]["hedline"]["hl2"].to_s.lstrip.rstrip
      self.tagline = doc_body["body.end"]["tagline"].to_s.lstrip.rstrip
      
      
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