require 'helper'

class TestDtiNitf < Test::Unit::TestCase
  @@xml = <<-EOT
  <?xml-stylesheet type="text/css" href="bulletin.css"?>
  <!DOCTYPE nitf SYSTEM "nitf-3-2.dtd">
  <nitf>
    <head>
      <meta name="project_group" content="AIRPORT 021010"/>
      <tobject tobject.type="news">
  <Keyword name = '19000'/><Keyword name = '334630'/><Keyword name = '4004'/><Keyword name = '4015001'/><Keyword name = '41220'/>
      </tobject>
      <docdata>
  	<doc.copyright holder="Western Communications, Inc."/>
  	<doc-id id-string="13973764"/>
  	<doc-name name-string="AIRPORT 021010"/> 
      </docdata>
      <pubdata name="The Bulletin " position.sequence="1 " position.section="LOCAL " date.publication="2010-02-10 "/>
    </head>
    <body>
      <body.head>
        <hedline>
  <hl1><p> Master plan to focus<b> on</b> attracting <x>new </x>tenants</p></hl1><hl2><p> Optimistic <x></x>about funding, officials hope to start work on plan in April</p></hl2>
        </hedline>
        <byline>
  	<person>By Hillary Borrud </person>
  	<byttl>The Bulletin </byttl>
        </byline>
      </body.head>
      <body.content>
  	 <p> Local officials hope a new plan for the Bend Municipal Airport will encourage economic development and help resolve neighbors<!-- 2019(unknown) --> concerns, including noise from low-flying aircraft.   </p><p> Bend officials hope to start work in April on a new airport master plan, which lays out where and how the city<!-- 2019(unknown) -->s airport will develop in the future. </p><p> Airport Manager Gary Judd said officials wanted to begin work on the airport master plan a year ago, but the city has struggled to find the money to pay for the project.  </p><p> A consultant will likely provide a cost estimate to the city before next Wednesday<!-- 2019(unknown) -->s City Council meeting, and Judd said the cost will probably exceed the $150,000 in Federal Aviation Administration money the city will receive this year.  </p><p> Officials were optimistic that the city can make up the shortfall. Bend Finance Director Sonia Andrews said the city could get money to cover the remaining cost from grants, airport revenue or the city<!-- 2019(unknown) -->s general fund.  </p><p> The city also is trying to find another agency that receives FAA money and cannot use all of the money it will receive this year. Bend Municipal Airport could borrow that money this year and pay it back with Bend<!-- 2019(unknown) -->s 2011 FAA money, Andrews said. </p><p> An up-to-date plan could make it easier for the city to do development projects at the airport. The airport sits on 415 acres northeast of Bend, on unincorporated land under Deschutes County<!-- 2019(unknown) -->s jurisdiction. </p><p> In September 2009, Deschutes County Commissioners Dennis Luke and Tammy Baney said they could not support the city<!-- 2019(unknown) -->s proposal to form a 526-acre urban renewal district, which would have redirected a portion of property taxes to fund the district.  </p><p> The district would have raised money for runway extensions, a new traffic control tower, highway improvements and other development. </p><p> The plan died before making it to an official vote, and Baney said at the time she would not be ready to vote on the issue until the city updated its airport master plan.  </p><p> Baney said Tuesday that it would not have been appropriate to allow development at the airport based on an old plan, and the process of drafting a new plan will provide an opportunity for neighbors and others to give input on the airport<!-- 2019(unknown) -->s future.  </p><p> Luke said Tuesday that without a more up-to-date airport master plan, he could not determine whether the city needed the renewal district. </p><p> The current airport master plan was completed in 1999, updated in 2002 and covers about 20 years. The process of drafting a new 20-year plan will take about a year and will include public meetings.  </p><p> The FAA will give the city input throughout the process, and the city needs the federal agency to sign off on the city<!-- 2019(unknown) -->s final vision of how the airport will develop in the future, Judd said. </p><p> Councilor Jim Clinton said the new airport master plan could help resolve questions about what type of businesses belong at the airport and how closely they should be tied to aviation.  </p><p> <!-- 201c(unknown) -->I personally like having a place where small businesses are doing some stuff that<!-- 2019(unknown) -->s not 100 percent aviation-related,<!-- 201d(unknown) --> Clinton said. The new plan also could set rules for how low aircraft can fly in areas around the airport, and other activities that impact neighbors. </p><p> Councilor Mark Capell said the document is important because the city needs an updated plan to receive federal grants for the airport and because it helps the city prepare for the airport<!-- 2019(unknown) -->s future. </p><p> <!-- 201c(unknown) -->The airport is one of the economic engines for our community,<!-- 201d(unknown) --> Capell said. </p><p> </p>


  	 <media media-type="image">
  			<media-id>1932102</media-id>
  			<media-name>airport-g1 021010</media-name>
  			<media-reference height="100" width="205" mime-type="application/postscript" source="1932102.eps"/>
  			<media-printcaption></media-printcaption>
  			<media-printproducer> </media-printproducer>
  			<media-originalcaption>Locator map of Bend Airport. Ramberg </media-originalcaption>
  			<media-source> </media-source>
  			<media-byline> </media-byline>
  			<media-job>airport 021010</media-job>
  			<media-notes> </media-notes>
  			<media-status>Worked</media-status>
  		</media>
      </body.content>  
  	<body.end>
  	<tagline>Hillary Borrud can be  reached at 541-617-7829 or  at hborrud@bendbulletin.com.  </tagline>
  	</body.end>
      </body>
  </nitf>
  EOT
  
  @@xml2 = <<-EOT
  <?xml-stylesheet type="text/css" href="bulletin.css"?>
  <!DOCTYPE nitf SYSTEM "nitf-3-2.dtd">
  <nitf>
    <head>
      <tobject tobject.type="news">
  <Keyword name = 'HNS'/><Keyword name = 'LUGE'/><Keyword name = 'OLY'/>
      </tobject>
      <docdata>
  	<doc.copyright holder="Western Communications, Inc."/>
  	<doc-id id-string="14032641"/>
  	<doc-name name-string="a1oly-luge 021410"/> 
      </docdata>
      <pubdata name="The Bulletin " position.sequence="8 " position.section="A " date.publication="2010-02-14 "/>
    </head>
    <body>
      <body.head>
        <hedline>
  <hl1><p> Luge: fast, risky and drawing red flags</p></hl1>
        </hedline>
        <byline>
  	<person>Houston Chronicle </person>
        </byline>
      </body.head>
      <body.content>
  	 <p> WHISTLER, British Columbia <!-- 2014(unknown) --> When the sliders gathered Saturday morning at the Whistler Sliding Centre <!-- 2014(unknown) --> ready to take to an Olympic luge run that, not 24 hours earlier, took the life of one of their competitors <!-- 2014(unknown) --> they encountered a course that was shorter, slower, and presumably safer than it had been a day earlier. They sat in a nearly silent starting area, mulling both competition and camaraderie, before launching themselves down the track again. </p><p> On other days, racing would have seemed routine, even at the Olympics. But over the course of an emotional day here, what emerged was the clear idea that athletes who participate in luge do so in part to go fast, risks be damned. Now, racing on a track that caused significant concern even prior to Friday<!-- 2019(unknown) -->s death of 21-year-old Nodar Kumaritashvili, the risks clearly can be fatal, a notion that was inescapable even in the midst of the sport<!-- 2019(unknown) -->s highest level of competition. </p><p> A stunning pall fell over the 2010 Winter Olympics after the Georgian luger was killed in a training run here, and calls are increasing for Olympic officials to ensure it doesn<!-- 2019(unknown) -->t happen again <!-- 2014(unknown) --> even if canceling the competition was the only way to do so. </p><p> But officials announced the competition would continue Saturday, though they shortened the run and made the course wall higher at the point where Kumaritashvili flew off the ice. </p><p> Officials from the International Luge Federation said Saturday they had considered postponing competition or canceling it altogether, but instead they announced they had erected a higher wall in the turn where Kumaritashvili lost control and sailed off the track, crashing into a metal pole. They altered the ice in that same area, another measure aimed at keeping sliders within the confines of the track. And they announced the men<!-- 2019(unknown) -->s event <!-- 2014(unknown) --> which includes two runs Saturday night and the final two runs today <!-- 2014(unknown) --> would begin from the women<!-- 2019(unknown) -->s starting area, shortening the course by more than 500 feet, a move that dropped speeds significantly. </p><p> Even before Friday<!-- 2019(unknown) -->s deadly crash, much of the talk about the luge centered on the threat to sliders presented by the fastest track in the world. </p><p> Safety is the dominant issue, with sliders twisting down the mountain at speeds of more than 90 mph on a 50-pound sled. (Manuel Pfister of Austria was clocked at what would be a world record 95 mph Thursday.) </p><p> The pre-games discussion of whether the $100 million track was safe swelled as sliders arrived. Once they got a taste of the track, lugers thought Curve 11 presented an especially treacherous challenge. That is where the majority of the crashes <!-- 2014(unknown) --> nearly 20 in just a few days of practice runs <!-- 2014(unknown) --> this week have occurred. </p><p> Kumaritashvili lost his life after losing control entering the final straightaway. </p><p> All but a few sliders decided to race, yet each dealt with the death of Kumaritashvili in whatever way he could. The day<!-- 2019(unknown) -->s events <!-- 2014(unknown) --> two training runs followed by the first two runs of competition in the evening <!-- 2014(unknown) --> carried on under a discernible pall, the memories of Friday<!-- 2019(unknown) -->s terrifying accident, shown repeatedly on television, still fresh. </p><p> V, a French-language Canadian television network, showed video of the Friday crash. Kumaritashvili came in high on the final turn, was thrown off his sled, and flew backward and over the left wall where he crashed with amazing force into a steel beam. </p><p> American Tony Benshoof tested the track just before the accident. He struggled through that curve too, but walked off with only a badly bruised toe. He was fortunate. </p><p> <!-- 201c(unknown) -->Because of the physics of the curves, and going at 95 miles per hour, there<!-- 2019(unknown) -->s a really small margin for error,<!-- 201d(unknown) --> Benshoof said. <!-- 201c(unknown) -->You really need to get it right from Curve 9 to get as far as Curve 13, because once you get to Curve 11 and 12, you<!-- 2019(unknown) -->re going too fast to correct yourself.<!-- 201d(unknown) --> </p><p> Many sliders might say anyone who has been anywhere near a luge track would know why it is one of the scariest and most exciting spectator sports at the games. It feeds the nature of those who participate the sport. They love the speed and overcome the fear. </p><p> Mark Grimmette, five-time Olympian and U.S. flag bearer at the opening ceremonies, said he and current luge doubles partner Brian Martin have crashed <!-- 201c(unknown) -->only three or four times<!-- 201d(unknown) --> in some 4,000 runs in training and competition over the past 13 years. </p><p> But after running down the track at Whistler, Grimmette, who says he loves pushing 3-4 Gs at 90 mph, questioned whether the sport had gone too far. <!-- 201c(unknown) -->I think we<!-- 2019(unknown) -->re probably getting close, too close to the edge,<!-- 201d(unknown) --> Grimmette said. <!-- 201c(unknown) -->The track is fast, it certainly is. You have to be on your game from (Curve) 11 down. It<!-- 2019(unknown) -->s something they definitely have to take into account when they design future tracks. </p><p> <!-- 201c(unknown) -->(A track) doesn<!-- 2019(unknown) -->t have to be faster to be tricky.<!-- 201d(unknown) --> </p><p> Luge was held out of the games until 1964 because many considered it too dangerous. Just before that first Olympic luge competition, Polish-born British slider Kazimierz Kay-Skrzypeski was killed in a crash on the Olympic course in Austria. </p><p> The games went on. So did luge. That unfortunate incident happened two weeks before the games began. </p><p> Kumaritashvili, who died while the Olympic torch was being carried through the streets of Vancouver Friday, wasn<!-- 2019(unknown) -->t among the top sliders in the world. He finished 44th in the World Cup standings and has almost no chance of winning a medal here. </p><p> The sport<!-- 2019(unknown) -->s international governing body released a statement late Friday night, about 10 hours after Kumaritashvili died, publicly blaming the 21-year-old for his own death. Athletes were attaining speeds at the Whistler Sliding Centre far exceeding what the track was designed for, but the track was not the problem. It was a user error, the statement implied. Kumaritashvili failed to compensate properly as he entered Curve 16 before he crashed at nearly 90 mph, the federation<!-- 2019(unknown) -->s statement said. It added, <!-- 201c(unknown) -->There was no indication that the accident was caused by deficiencies in the track.<!-- 201d(unknown) --> </p><p> But is inexperience the lone reason for the tragedy? </p><p> Italy<!-- 2019(unknown) -->s Armin Zoeggler, a five-time Olympian who won the gold medal at the last two Olympics, also crashed on Friday. </p><p> The province<!-- 2019(unknown) -->s coroner, the Royal Canadian Mounted Police and federation are all investigating Kumaritashvili<!-- 2019(unknown) -->s death. </p><p> <!-- 201c(unknown) -->It is a nervous situation,<!-- 201d(unknown) --> Atis Strenga, president of the Latvia Luge Federation, said. <!-- 201c(unknown) -->It<!-- 2019(unknown) -->s a big tragedy for all luge. I hope, we all hope, it<!-- 2019(unknown) -->s the first accident and the last accident in this race.<!-- 201d(unknown) --> </p><p> </p>


  	 <media media-type="image">
  			<media-id>1939423</media-id>
  			<media-name>a1oly-luge-p2 021410</media-name>
  			<media-reference height="280" width="420" mime-type="image/jpeg" source="1939423.jpg"/>
  			<media-printcaption>Candles and flowers memorialize Nodar Kumaritashvili at Olympic Rings Park in Whistler, British Columbia. The Georgian luger was killed Friday when he lost control of his sled near the end of his training run while traveling about 89.7 mph.</media-printcaption>
  			<media-printproducer> New York Times News Service</media-printproducer>
  			<media-originalcaption>Candles and flowers comprise a memorial to luge athlete Nodar Kumaritashvili of the Republic of Georgia at Olympic Rings Park in Whistler, British Columbia, on Friday night, Feb. 12, 2010. Kumaritashvili  was killed when he lost control of his luge sled near the end of his training run while traveling 144.3 kilometers per hour, or about 89.7 miles an hour. (Doug Mills/The New York Times)  
   </media-originalcaption>
  			<media-source>NYTNS</media-source>
  			<media-byline>DOUG MILLS</media-byline>
  			<media-job> </media-job>
  			<media-notes>26.19%  3col   DWRAY</media-notes>
  			<media-status>Worked</media-status>
  		</media>
      </body.content>  
  	<body.end>
  	<tagline>The New York Times  and The Washington Post contributed to this report.  </tagline>
  	</body.end>
      </body>
  </nitf>
  EOT
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
    
    should "have a publication data" do
      assert @story.publication == "The Bulletin"
      assert @story.section == "LOCAL"
      assert @story.pub_date == "2010-02-10"
      assert @story.page == 1
    end
    
    should "include all paragraphs" do
      assert @story.body == "<p> Local officials hope a new plan for the Bend Municipal Airport will encourage economic development and help resolve neighbors&#x2019 concerns, including noise from low-flying aircraft.   </p><p> Bend officials hope to start work in April on a new airport master plan, which lays out where and how the city&#x2019s airport will develop in the future. </p><p> Airport Manager Gary Judd said officials wanted to begin work on the airport master plan a year ago, but the city has struggled to find the money to pay for the project.  </p><p> A consultant will likely provide a cost estimate to the city before next Wednesday&#x2019s City Council meeting, and Judd said the cost will probably exceed the $150,000 in Federal Aviation Administration money the city will receive this year.  </p><p> Officials were optimistic that the city can make up the shortfall. Bend Finance Director Sonia Andrews said the city could get money to cover the remaining cost from grants, airport revenue or the city&#x2019s general fund.  </p><p> The city also is trying to find another agency that receives FAA money and cannot use all of the money it will receive this year. Bend Municipal Airport could borrow that money this year and pay it back with Bend&#x2019s 2011 FAA money, Andrews said. </p><p> An up-to-date plan could make it easier for the city to do development projects at the airport. The airport sits on 415 acres northeast of Bend, on unincorporated land under Deschutes County&#x2019s jurisdiction. </p><p> In September 2009, Deschutes County Commissioners Dennis Luke and Tammy Baney said they could not support the city&#x2019s proposal to form a 526-acre urban renewal district, which would have redirected a portion of property taxes to fund the district.  </p><p> The district would have raised money for runway extensions, a new traffic control tower, highway improvements and other development. </p><p> The plan died before making it to an official vote, and Baney said at the time she would not be ready to vote on the issue until the city updated its airport master plan.  </p><p> Baney said Tuesday that it would not have been appropriate to allow development at the airport based on an old plan, and the process of drafting a new plan will provide an opportunity for neighbors and others to give input on the airport&#x2019s future.  </p><p> Luke said Tuesday that without a more up-to-date airport master plan, he could not determine whether the city needed the renewal district. </p><p> The current airport master plan was completed in 1999, updated in 2002 and covers about 20 years. The process of drafting a new 20-year plan will take about a year and will include public meetings.  </p><p> The FAA will give the city input throughout the process, and the city needs the federal agency to sign off on the city&#x2019s final vision of how the airport will develop in the future, Judd said. </p><p> Councilor Jim Clinton said the new airport master plan could help resolve questions about what type of businesses belong at the airport and how closely they should be tied to aviation.  </p><p> \"I personally like having a place where small businesses are doing some stuff that&#x2019s not 100 percent aviation-related,\" Clinton said. The new plan also could set rules for how low aircraft can fly in areas around the airport, and other activities that impact neighbors. </p><p> Councilor Mark Capell said the document is important because the city needs an updated plan to receive federal grants for the airport and because it helps the city prepare for the airport&#x2019s future. </p><p> \"The airport is one of the economic engines for our community,\" Capell said. </p><p></p>"
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
