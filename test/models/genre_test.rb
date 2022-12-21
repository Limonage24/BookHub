require "test_helper"

class GenreTest < ActiveSupport::TestCase
  test "shouldn't create Genre without name" do
    genre = Genre.new
    assert_not genre.save
  end

  test 'should create Genre with name' do
    genre = Genre.new
    genre.name = 'Novel'
    assert genre.save
  end
end
