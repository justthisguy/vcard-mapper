require_relative '../vcard/parser'

# p "the quick brown fox jumped over the lazy brown dog".split_by_chunk_size(10)
#   #=> ["the quick", "brown fox", "jumped over", "the lazy", "brown dog"]


describe Vcard::Parser do
	let(:parser) { Vcard::Parser.new :file_path => file_path }
	
	context "there is a file with one vcard" do
		let(:file_path) { "../card.vcf" }

		it "has many lines" do
			parser.lines.count.should == 12
		end

		context "it parses lines" do

			it "returns a header and a body" do
				parser.parse_line("header:body")
					.should ==  ["header", "body", nil]
			end

			it "returns a property, a body and any attributes" do
				parser.parse_line("TEL;type=WORK;type=VOICE;type=pref:(408) 996-3553 x220")
					.should == ["TEL", "(408) 996-3553 x220", "type=WORK;type=VOICE;type=pref"]
			end

			it "removes newline at end of each line" do
				parser.parse_line("foo:bar\n")[1][-1].should_not == "\n"
			end
		end

		it "parse returns an array of arrays" do
			parser.parse[0].should be_a(Array)
		end

	end

	context "there is a file with one vcard" do
		let(:file_path) { "../card.vcf" }

		it "has many lines" do
			parser.lines.count.should == 12
		end

	end


end

# parse card.vcf
	# there are 12 lines
	# each line has a header (property + attrs)
	# each line has a body
	# each line has property
	# each line has attrs
	# .parse returns a 2-D array (array of arrays)
	#. parse returned array should have 12 elements

	# VCardParser

	# @vcard_file_contents?

