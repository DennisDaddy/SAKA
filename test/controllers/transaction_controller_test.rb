require 'test_helper'

class TransactionControllerTest < ActionDispatch::IntegrationTest
  test "should get checkout" do
    get transaction_checkout_url
    assert_response :success
  end

end
