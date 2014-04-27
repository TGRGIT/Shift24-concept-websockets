class PairingsPlayersController < ApplicationController
  before_action :set_pairings_player, only: [:show, :edit, :update, :destroy]

  # GET /pairings_players
  # GET /pairings_players.json
  def index
    @pairings_players = PairingsPlayer.all
  end

  # GET /pairings_players/1
  # GET /pairings_players/1.json
  def show
  end

  # GET /pairings_players/new
  def new
    @pairings_player = PairingsPlayer.new
  end

  # GET /pairings_players/1/edit
  def edit
  end

  # POST /pairings_players
  # POST /pairings_players.json
  def create
    @pairings_player = PairingsPlayer.new(pairings_player_params)

    respond_to do |format|
      if @pairings_player.save
        format.html { redirect_to @pairings_player, notice: 'Pairings player was successfully created.' }
        format.json { render :show, status: :created, location: @pairings_player }
      else
        format.html { render :new }
        format.json { render json: @pairings_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pairings_players/1
  # PATCH/PUT /pairings_players/1.json
  def update
    respond_to do |format|
      if @pairings_player.update(pairings_player_params)
        format.html { redirect_to @pairings_player, notice: 'Pairings player was successfully updated.' }
        format.json { render :show, status: :ok, location: @pairings_player }
      else
        format.html { render :edit }
        format.json { render json: @pairings_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pairings_players/1
  # DELETE /pairings_players/1.json
  def destroy
    @pairings_player.destroy
    respond_to do |format|
      format.html { redirect_to pairings_players_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pairings_player
      @pairings_player = PairingsPlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pairings_player_params
      params.require(:pairings_player).permit(:pairing_id, :player_id)
    end
end
