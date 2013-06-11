require_relative '../../vcard/property'

describe Vcard::Property do
	let(:property) { Vcard::Property.new }

	it "creates a property" do
		property.should be_a Vcard::Property
	end

	context ""
	it "has a name" do
		
		property.name == "TEL"
	end
end
