require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get main' do
    get root_url
    assert_response :success
  end

  test 'should get search' do
    get search_url, params: { query: 'something' }
    assert_response :success
  end

  test 'should get main from search' do
    get search_url, params: { query: 'home' }
    assert_redirected_to root_url

    get search_url
    assert_redirected_to root_url
  end
end
