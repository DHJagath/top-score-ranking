require "test_helper"

class PlayerScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_score = player_scores(:one)
  end

  test "should get index" do
    get player_scores_url, as: :json
    assert_response :success
  end

  test "should create player_score" do
    assert_difference('PlayerScore.count') do
      post player_scores_url, params: { player_score: { playername: @player_score.playername, score: @player_score.score, scoreid: @player_score.scoreid, time: @player_score.time } }, as: :json
    end

    assert_response 201
  end

  test "should show player_score" do
    get player_score_url(@player_score), as: :json
    assert_response :success
  end

  test "should update player_score" do
    patch player_score_url(@player_score), params: { player_score: { playername: @player_score.playername, score: @player_score.score, scoreid: @player_score.scoreid, time: @player_score.time } }, as: :json
    assert_response 200
  end

  test "should destroy player_score" do
    assert_difference('PlayerScore.count', -1) do
      delete player_score_url(@player_score), as: :json
    end

    assert_response 204
  end
end
