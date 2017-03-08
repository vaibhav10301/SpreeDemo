require 'test_helper'

class ErpIntegrationsControllerTest < ActionController::TestCase
  setup do
    @erp_integration = erp_integrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:erp_integrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create erp_integration" do
    assert_difference('ErpIntegration.count') do
      post :create, erp_integration: { name: @erp_integration.name, selected: @erp_integration.selected, token: @erp_integration.token, url: @erp_integration.url }
    end

    assert_redirected_to erp_integration_path(assigns(:erp_integration))
  end

  test "should show erp_integration" do
    get :show, id: @erp_integration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @erp_integration
    assert_response :success
  end

  test "should update erp_integration" do
    patch :update, id: @erp_integration, erp_integration: { name: @erp_integration.name, selected: @erp_integration.selected, token: @erp_integration.token, url: @erp_integration.url }
    assert_redirected_to erp_integration_path(assigns(:erp_integration))
  end

  test "should destroy erp_integration" do
    assert_difference('ErpIntegration.count', -1) do
      delete :destroy, id: @erp_integration
    end

    assert_redirected_to erp_integrations_path
  end
end
