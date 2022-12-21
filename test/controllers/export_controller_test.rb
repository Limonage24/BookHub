require 'test_helper'

class ExportControllerTest < ActionDispatch::IntegrationTest
  test 'should get export_db' do
    sign_in_as(users(:admin))

    get export_export_db_url
    assert_redirected_to root_url
  end
end
