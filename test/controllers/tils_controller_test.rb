require 'test_helper'

class TilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @til = tils(:one)
  end

  test "should get index" do
    get tils_url, as: :json
    assert_response :success
  end

  test "should create til" do
    assert_difference('Til.count') do
      post tils_url, params: { til: { author_id: @til.author_id, description: @til.description } }, as: :json
    end

    assert_response 201
  end

  test "should show til" do
    get til_url(@til), as: :json
    assert_response :success
  end

  test "should update til" do
    patch til_url(@til), params: { til: { author_id: @til.author_id, description: @til.description } }, as: :json
    assert_response 200
  end

  test "should destroy til" do
    assert_difference('Til.count', -1) do
      delete til_url(@til), as: :json
    end

    assert_response 204
  end
end
