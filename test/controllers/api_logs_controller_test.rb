require "test_helper"

class ApiLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_log = api_logs(:one)
  end

  test "should get index" do
    get api_logs_url, as: :json
    assert_response :success
  end

  test "should create api_log" do
    assert_difference("ApiLog.count") do
      post api_logs_url, params: { api_log: { method: @api_log.method, req: @api_log.req, route: @api_log.route } }, as: :json
    end

    assert_response :created
  end

  test "should show api_log" do
    get api_log_url(@api_log), as: :json
    assert_response :success
  end

  test "should update api_log" do
    patch api_log_url(@api_log), params: { api_log: { method: @api_log.method, req: @api_log.req, route: @api_log.route } }, as: :json
    assert_response :success
  end

  test "should destroy api_log" do
    assert_difference("ApiLog.count", -1) do
      delete api_log_url(@api_log), as: :json
    end

    assert_response :no_content
  end
end
