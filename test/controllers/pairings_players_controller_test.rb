require 'test_helper'

class PairingsPlayersControllerTest < ActionController::TestCase
  setup do
    @pairings_player = pairings_players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pairings_players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pairings_player" do
    assert_difference('PairingsPlayer.count') do
      post :create, pairings_player: { pairing_id: @pairings_player.pairing_id, player_id: @pairings_player.player_id }
    end

    assert_redirected_to pairings_player_path(assigns(:pairings_player))
  end

  test "should show pairings_player" do
    get :show, id: @pairings_player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pairings_player
    assert_response :success
  end

  test "should update pairings_player" do
    patch :update, id: @pairings_player, pairings_player: { pairing_id: @pairings_player.pairing_id, player_id: @pairings_player.player_id }
    assert_redirected_to pairings_player_path(assigns(:pairings_player))
  end

  test "should destroy pairings_player" do
    assert_difference('PairingsPlayer.count', -1) do
      delete :destroy, id: @pairings_player
    end

    assert_redirected_to pairings_players_path
  end
end
