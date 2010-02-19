module DTI
  class Story
    attr_accessor :raw_xml, :doc_id, :copyright_holder, :doc_name
    attr_accessor :publication, :section, :pub_date, :page
    
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
      
    end    
  end
end