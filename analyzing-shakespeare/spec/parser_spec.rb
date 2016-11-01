require "xmlparser"

describe XMLParser do

  describe '#parse' do
    let(:parsed_file) { ["<SPEECH>\n",
                                   "<SPEAKER>Sergeant</SPEAKER>\n",
                                   "<LINE>Doubtful it stood;</LINE>\n",
                                   "<LINE>As two spent swimmers, that do cling together</LINE>\n",
                                   "<LINE>And choke their art. The merciless Macdonwald--</LINE>\n",
                                   "<LINE>Worthy to be a rebel, for to that</LINE>\n",
                                   "<LINE>The multiplying villanies of nature</LINE>\n",
                                   "<LINE>Do swarm upon him--from the western isles</LINE>\n",
                                   "<LINE>Of kerns and gallowglasses is supplied;</LINE>\n",
                                   "<LINE>And fortune, on his damned quarrel smiling,</LINE>\n",
                                   "<LINE>Show'd like a rebel's whore: but all's too weak:</LINE>\n",
                                   "<LINE>For brave Macbeth--well he deserves that name--</LINE>\n",
                                   "<LINE>Disdaining fortune, with his brandish'd steel,</LINE>\n",
                                   "<LINE>Which smoked with bloody execution,</LINE>\n",
                                   "<LINE>Like valour's minion carved out his passage</LINE>\n",
                                   "<LINE>Till he faced the slave;</LINE>\n",
                                   "<LINE>Which ne'er shook hands, nor bade farewell to him,</LINE>\n",
                                   "<LINE>Till he unseam'd him from the nave to the chaps,</LINE>\n",
                                   "<LINE>And fix'd his head upon our battlements.</LINE>\n",
                                   "</SPEECH>\n"] }

    context "with valid xml file: " do
      it "converts XML to ruby object" do
        parser = XMLParser.new('spec/mockbeth.xml')

        expect(parser.parse).to eq parsed_file
      end
    end
  end
end
