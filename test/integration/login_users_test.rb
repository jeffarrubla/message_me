require 'test_helper'

class LoginUsersTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create(username: "john", password: "password")
	end

	test "should login a user" do
		get login_path
		assert_template 'sessions/new'
		post login_path, params: {session: {username: "john", password: "password"}}
		follow_redirect!
		assert_template 'chatroom/index'	
	end

end