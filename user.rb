require 'json' 
class User
	
	attr_accessor :email, :name, :permissions
	
	def initialize(*args)
		@email = args[0]                     	
		@name = args[1]
		@permissions = User.user_perm 
	end
	
	def self.user_perm
		file = File.read 'user_perm.json'
		JSON.load(file, nil, symbolize_names: true)
	end
	
	def save
		savedusers = {email: @email, name: @name.capitalize, permissions: @permissions}.to_json
		open('users.json', 'a') do |file|
			file.puts savedusers
		end
	end
	
	def self.display
		display_users = File.open('users.json', 'r'){|file| file.read}
		puts display_users
	end
	def self.login
 		File.open('users.json') do |f|
  		f.any? do |line|
    	line.include?(word)
  	end
	end
	end
end