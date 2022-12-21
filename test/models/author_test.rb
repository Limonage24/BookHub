require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "shouldn't create Author without name" do
    author = Author.new
    assert_not author.save
  end

  test 'should create Author with name' do
    author = Author.new
    author.name = 'William Shakespeare'
    assert author.save
  end
end
