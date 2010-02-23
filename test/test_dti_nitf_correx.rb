require 'helper'

class TestDtiNitfCorrex < Test::Unit::TestCase
  @@xml = <<-EOT
  <?xml-stylesheet type="text/css" href="bulletin.css"?>
  <!DOCTYPE nitf SYSTEM "nitf-3-2.dtd">
  <nitf>
    <head>

      <docdata>
  	<doc.copyright holder="Western Communications, Inc."/>
  	<doc-id id-string="14022204"/>
  	<doc-name name-string="CORREX 021410"/> 
      </docdata>
      <pubdata name="The Bulletin " position.sequence="1 " position.section="A " date.publication="2010-02-14 "/>
      <original-storyid>14015998</original-storyid>
    </head>
    <body>
      <body.head>
        <hedline>
  <hl1></hl1><hl2></hl2>
        </hedline>
        <byline>
        </byline>
      </body.head>
      <body.content>
  	 <hl2><p> Correction </p></hl2><p> In a column titled <!-- 201c(unknown) -->The power and joy of libraries,<!-- 201d(unknown) --> which appears today on Page F1, Deschutes Public Library Director Todd Dunkelberg<!-- 2019(unknown) -->s name is incorrect. </p><p> The Bulletin regrets the error.</p>


      </body.content>  
  	<body.end>
  	</body.end>
      </body>
  </nitf>
  EOT
  
  context "A Story Correction" do
    setup do
      @story = DTI::Story.new(@@xml)
    end
    
    should "have an orginal story id" do
      assert @story.correction?
      assert @story.original_story_id == 14015998
    end
    
    should "have a body" do
      assert @story.body == "<p> In a column titled \"The power and joy of libraries,\" which appears today on Page F1, Deschutes Public Library Director Todd Dunkelberg&#x2019s name is incorrect. </p><p> The Bulletin regrets the error.</p>"
    end
    
    should "have a hl1" do
      assert @story.hl1 == "Correction"
    end
  end
end