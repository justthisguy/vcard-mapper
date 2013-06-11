require "redis"

class Mapper
	attr_accessor :redis

	def redis
		@redis ||= Redis.new
	end

	def store_property property
		prefix = "#{property[:card_id]}:#{property[:name]}"

		body_key = "#{prefix}:body"
		body_value = property[:body]
		redis.set(body_key, body_value)

		type_key = "#{prefix}:types"
		type_value = property[:types]
		redis.set(type_key, type_value)
		
	end

end