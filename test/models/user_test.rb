require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example user', email: 'user@example.com')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = " "
    assert_not @user.valid?
  end

  test 'email validation should accept valid adresses' do
    valid_addresses = %w[user@example.com USER@foo.COM a_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject valid adresses' do
    valid_addresses = %w[user@example,com USER_foo.COM a_US-ER@foo+bar.org first.last@foo_jp alice+bob@baz.]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_not @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
