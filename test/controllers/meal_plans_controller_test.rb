require "test_helper"

class MealPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meal_plans_index_url
    assert_response :success
  end
end
