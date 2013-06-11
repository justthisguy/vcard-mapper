require_relative '../mapper'

# p "the quick brown fox jumped over the lazy brown dog".split_by_chunk_size(10)
#   #=> ["the quick", "brown fox", "jumped over", "the lazy", "brown dog"]


describe Mapper do
	let(:mapper) { Mapper.new }
	let(:redis)  { mapper.redis }

	before(:each) do
		redis.flushdb
	end
	
	context "we have a property" do
		let(:property) {  
			{
				card_id: '12345', 
				name:'foo',
				body: 'bar',
				types: ['baz', 'quux']
			}
		}

		before(:each) do
			mapper.store_property(property)
		end

		it "stores the property body" do
			redis.get('12345:foo:body').should == 'bar'
		end

		it "stores the property types" do
			mapper.redis.get('12345:foo:types').should == ['baz', 'quux']
		end

		# it "retrieves the property" do
		# 	mapper.redis(:property)
		# 	mapper.get_property('12345', 'foo').should == [:property]
		# end

	end
end


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# K: card_id:property_name:types  
# V: ['baz', 'quux']

# K: card_id:property_name:body
# V: 'bar'

# K: '1234:N:body'
# V: ['Jones','Robert','Harry','Dr','Jr']
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ['card_id', property]
# property = [name, body, types]
# types = [type1, type2, ...]