require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:comment1)
  end

  test 'should create comment' do
    user = users(:user1)
    sign_in_as(user)
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { book_id: @comment.book_id, content: @comment.content,
                                              reply_to: @comment.reply_to } }
    end

    assert_redirected_to book_url(@comment.book)
  end

  test 'should update comment' do
    user = users(:user1)
    sign_in_as(user)

    patch comment_url(@comment), params: { comment: { book_id: @comment.book_id, content: @comment.content,
                                                      reply_to: @comment.reply_to }, user: { id: user.id } }
    assert_redirected_to book_url(@comment.book)
  end

  test 'should destroy comment' do
    user = users(:admin)
    sign_in_as(user)

    delete comment_url(@comment)
    @comment.reload

    assert_equal 'Комментарий был удалён.', @comment.content
    assert @comment.deleted

    assert_redirected_to book_url(@comment.book)
  end
end
