# require 'test_helper'

# class PasswordResetsTest < ActionDispatch::IntegrationTest

#   def setup
#     ActionMailer::Base.deliveries.clear
#     @user = users(:michael)
#   end

#   def invalid_email
#     post password_resets_path, params: { password_reset: { email: "" } }
#     assert_not flash.empty?
#     assert_template 'password_resets/new'
#   end

#   def valid_email
#     post password_resets_path,
#          params: { password_reset: { email: @user.email } }
#     assert_not_equal @user.reset_digest, @user.reload.reset_digest
#     assert_equal 1, ActionMailer::Base.deliveries.size
#     assert_not flash.empty?
#     assert_redirected_to root_url
#   end

#   def inactive_user
#     user.toggle!(:activated)
#     get edit_password_reset_path(user.reset_token, email: user.email)
#     assert_redirected_to root_url
#     user.toggle!(:activated)
#   end

#   def wrong_token
#     get edit_password_reset_path('wrong token', email: user.email)
#     assert_redirected_to root_url
#   end

#   def right_token
#     get edit_password_reset_path(user.reset_token, email: user.email)
#     assert_template 'password_resets/edit'
#     assert_select "input[name=email][type=hidden][value=?]", user.email
#   end

#   def invalid_password
#     patch password_reset_path(user.reset_token),
#           params: { email: user.email,
#                     user: { password:              "foobaz",
#                             password_confirmation: "barquux" } }
#     assert_select 'div#error_explanation'
#   end

#   def empty_password
#     patch password_reset_path(user.reset_token),
#           params: { email: user.email,
#                     user: { password:              "",
#                             password_confirmation: "" } }
#     assert_select 'div#error_explanation'
#   end

#   def valid_password
#     patch password_reset_path(user.reset_token),
#           params: { email: user.email,
#                     user: { password:              "foobaz",
#                             password_confirmation: "foobaz" } }
#     assert is_logged_in?
#     assert_not flash.empty?
#     assert_redirected_to user
#   end

#   test "password resets" do
#     get new_password_reset_path
#     assert_template 'password_resets/new'
#     # Invalid email
#     invalid_email
#     # Valid email
#     valid_email
#     # Password reset form
#     user = assigns(:user)
#     # Wrong email
#     get edit_password_reset_path(user.reset_token, email: "")
#     assert_redirected_to root_url
#     # Inactive user
#     inactive_user
#     # Right email, wrong token
#     wrong_token
#     # Right email, right token
#     right_token
#     # Invalid password & confirmation
#     invalid_password
#     # Empty password
#     empty_password
#     # Valid password & confirmation
#     valid_password
#   end
# end

require "test_helper"
class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:michael)
  end

  test "password resets" do
    get new_password_reset_path
    assert_template "password_resets/new"
    # Invalid email
    post password_resets_path, params: {password_reset: {email: ""}}
    assert_not flash.empty?
    assert_template "password_resets/new"
    # Valid email
    post password_resets_path, params: {password_reset: {email: @user.email}}
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url
    # Password reset form
    user = assigns(:user)
    # Wrong email
    get edit_password_reset_path(user.reset_token, email: "")
    assert_redirected_to root_url
    # Inactive user
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_redirected_to root_url
    user.toggle!(:activated)
    # Right email, wrong token
    get edit_password_reset_path("wrong token", email: user.email)
    assert_redirected_to root_url
    # Right email, right token
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_template "password_resets/edit"
    assert_select "input[name=email][type=hidden][value=?]", user.email
    check_valid user
  end
  def check_valid user
    patch password_reset_path(user.reset_token),
      params: {email: user.email,
               user: {password: "foobaz",
                      password_confirmation: "barquux"}}
    assert_select "div#error_explanation"
    patch password_reset_path(user.reset_token),
      params: {email: user.email,
               user: {password: "",
                      password_confirmation: ""}}
    assert_select "div#error_explanation"
    patch password_reset_path(user.reset_token),
      params: {email: user.email,
               user: {password: "foobaz",
                      password_confirmation: "foobaz"}}
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user
  end
end
