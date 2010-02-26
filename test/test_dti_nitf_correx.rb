require 'helper'

class TestDtiNitfCorrex < Test::Unit::TestCase
  @@xml = File.read('fixtures/correction.xml')
  
  context "A Story Correction" do
    setup do
      @story = DTI::Story.new(@@xml)
    end
    
    should "have an orginal story id" do
      assert @story.correction?
      assert @story.original_story_id == 14015998
    end
    
    should "have a body" do
      puts @story.body
      assert @story.body == '<p>In a column titled "The power and joy of libraries," which appears today on Page F1, Deschutes Public Library Director Todd Dunkelberg&#x2019s name is incorrect.</p><p>The Bulletin regrets the error.</p>'
    end
    
    should "have a hl1" do
      assert @story.hl1 == "Correction"
    end
  end
end