require 'test_helper'

class CreateMessagesTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = User.create(username: "john", password: "password")
	end

	test "should create a new message" do 
		sign_in_as(@user,"password")
		get root_path
		assert_template 'chatroom/index'
		assert_difference 'Message.count', 1 do
			post message_path, params: {message: {body: "This is a message from test"}}			
		end
		assert_template 'messages/_message'
		assert_match "This is a message from test", response.body
	end	
end
