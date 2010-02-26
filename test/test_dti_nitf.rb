require 'helper'
require 'pp'

class TestDtiNitf < Test::Unit::TestCase
  @@xml = File.read('fixtures/basic-story.xml')
  
  @@xml2 = File.read('fixtures/basic-story-2.xml')
  
  context "An NITF Parser instance" do
    setup do
      @story = DTI::Story.new(@@xml)
    end
    
    should "should remove java BOMS" do 
      assert_nil @story.raw_xml =~ /\xef\xbb\xbf/
    end
    
    should "remove tabs" do 
      assert_nil @story.raw_xml =~ /\t/
    end
    
    should "remove bad character output from DTI export" do 
      assert_nil @story.raw_xml =~ /([\x00-\x09])/
      assert_nil @story.raw_xml =~ /([\x0B\x0C\x0E-\x1F])/
    end
    
    should "remove the un-wanted new line/carriage returns" do
      assert_nil @story.raw_xml =~ /\r\n/
      assert_nil @story.raw_xml =~ /\n\r/
      assert_nil @story.raw_xml =~ /\r/
    end
    
    should "remove the 007 character we add to parse" do
      assert_nil @story.raw_xml =~ /\007/
    end
    
    should "lowercase the known upercase charaters from DTI export" do 
      assert_nil @story.raw_xml =~ /<EM STYLE="BOLD">/
      assert_nil @story.raw_xml =~ /<\/EM>/
      assert_nil @story.raw_xml =~ /&AMP;/
      assert_nil @story.raw_xml =~ /<P>/
      assert_nil @story.raw_xml =~ /<\/P>/
    end
    
    should "convert stupid ass unicode from DTI export" do
      assert_nil @story.raw_xml =~ /<!-- .*?\(unknown\) -->/
      assert @story.raw_xml =~ /&#x2019/
      assert @story.raw_xml =~ /&#x201c/
      assert @story.raw_xml =~ /&#x201d/
    end
    
    should "get rid of all tags in hl1 and hl2 fields" do
      assert @story.raw_xml =~ /<hl1>Master plan to focus on attracting new tenants<\/hl1>/
      assert @story.raw_xml =~ /<hl2>Optimistic about funding, officials hope to start work on plan in April<\/hl2>/ 
    end
  end
  
  context "A Story object" do 
    setup do
      @story = DTI::Story.new(@@xml)
      @story2 = DTI::Story.new(@@xml2)
    end
    
    should "have a doc_id" do
      assert @story.doc_id == 13973764
    end
    
    should "have a copyright holder" do
      assert @story.copyright_holder == "Western Communications, Inc."
    end
    
    should "have a document name" do
      assert @story.doc_name == "AIRPORT 021010"
    end
    
    should "have a publication" do
      assert @story.publication == "The Bulletin"
    end

    should "have a section" do
      assert @story.section == "LOCAL"
    end
    
    should "have a pub date" do 
      assert @story.pub_date == "2010-02-10"
    end
    
    should "have a page" do
      assert @story.page == 1
    end
    
    should "include all paragraphs" do
      assert @story.body == '<p>Local officials hope a new plan for the Bend Municipal Airport will encourage economic development and help resolve neighbors&#x2019 concerns, including noise from low-flying aircraft.</p><p>Bend officials hope to start work in April on a new airport master plan, which lays out where and how the city&#x2019s airport will develop in the future.</p><p>Airport Manager Gary Judd said officials wanted to begin work on the airport master plan a year ago, but the city has struggled to find the money to pay for the project.</p><p>A consultant will likely provide a cost estimate to the city before next Wednesday&#x2019s City Council meeting, and Judd said the cost will probably exceed the $150,000 in Federal Aviation Administration money the city will receive this year.</p><p>Officials were optimistic that the city can make up the shortfall. Bend Finance Director Sonia Andrews said the city could get money to cover the remaining cost from grants, airport revenue or the city&#x2019s general fund.</p><p>The city also is trying to find another agency that receives FAA money and cannot use all of the money it will receive this year. Bend Municipal Airport could borrow that money this year and pay it back with Bend&#x2019s 2011 FAA money, Andrews said.</p><p>An up-to-date plan could make it easier for the city to do development projects at the airport. The airport sits on 415 acres northeast of Bend, on unincorporated land under Deschutes County&#x2019s jurisdiction.</p><p>In September 2009, Deschutes County Commissioners Dennis Luke and Tammy Baney said they could not support the city&#x2019s proposal to form a 526-acre urban renewal district, which would have redirected a portion of property taxes to fund the district.</p><p>The district would have raised money for runway extensions, a new traffic control tower, highway improvements and other development.</p><p>The plan died before making it to an official vote, and Baney said at the time she would not be ready to vote on the issue until the city updated its airport master plan.</p><p>Baney said Tuesday that it would not have been appropriate to allow development at the airport based on an old plan, and the process of drafting a new plan will provide an opportunity for neighbors and others to give input on the airport&#x2019s future.</p><p>Luke said Tuesday that without a more up-to-date airport master plan, he could not determine whether the city needed the renewal district.</p><p>The current airport master plan was completed in 1999, updated in 2002 and covers about 20 years. The process of drafting a new 20-year plan will take about a year and will include public meetings.</p><p>The FAA will give the city input throughout the process, and the city needs the federal agency to sign off on the city&#x2019s final vision of how the airport will develop in the future, Judd said.</p><p>Councilor Jim Clinton said the new airport master plan could help resolve questions about what type of businesses belong at the airport and how closely they should be tied to aviation.</p><p>"I personally like having a place where small businesses are doing some stuff that&#x2019s not 100 percent aviation-related," Clinton said. The new plan also could set rules for how low aircraft can fly in areas around the airport, and other activities that impact neighbors.</p><p>Councilor Mark Capell said the document is important because the city needs an updated plan to receive federal grants for the airport and because it helps the city prepare for the airport&#x2019s future.</p><p>"The airport is one of the economic engines for our community," Capell said.</p><p></p>'
    end
    
    should "have a byline" do
      assert @story.byline == "Hillary Borrud"
    end
    
    should "have a paper" do
      assert @story.paper == "The Bulletin"
    end
    
    should "have a headline" do
      assert @story.hl1 == "Master plan to focus on attracting new tenants"
      assert @story.hl2 == "Optimistic about funding, officials hope to start work on plan in April"
    end
    
    should "should have a tagline" do
      assert @story.tagline == "Hillary Borrud can be  reached at 541-617-7829 or  at hborrud@bendbulletin.com."
    end
    
    should "process correcly if there is no byttl tag" do
      assert_nil @story2.paper
    end
  end
end
