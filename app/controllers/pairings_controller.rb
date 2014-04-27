class PairingsController < ApplicationController
  before_action :set_pairing, only: [:show, :edit, :update, :destroy]

  # GET /pairings
  # GET /pairings.json
  def index
    @pairings = Pairing.all
  end

  # GET /pairings/1
  # GET /pairings/1.json
  def show
  end

  # GET /pairings/new
  def new
    @pairing = Pairing.new
  end

  # GET /pairings/1/edit
  def edit
  end

  # POST /pairings
  # POST /pairings.json
  def create
    @pairing = Pairing.new
    @pairing.timeout = 24.hours.from_now
    @pairing.lockdownScore=0
    respond_to do |format|
      if @pairing.save && @pairing.players << Player.find(params[:player1]) && @pairing.players << Player.find(params[:player2])
        format.html { redirect_to @pairing, notice: 'Pairing was successfully created.' }
        format.json { render :show, status: :created, location: @pairing }
      else
        format.html { render :new }
        format.json { render json: @pairing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pairings/1
  # PATCH/PUT /pairings/1.json
  def update
    respond_to do |format|
      if @pairing.update(pairing_params)
        format.html { redirect_to @pairing, notice: 'Pairing was successfully updated.' }
        format.json { render :show, status: :ok, location: @pairing }
      else
        format.html { render :edit }
        format.json { render json: @pairing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pairings/1
  # DELETE /pairings/1.json
  def destroy
    @pairing.destroy
    respond_to do |format|
      format.html { redirect_to pairings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pairing
      @pairing = Pairing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pairing_params
      params.require(:pairing).permit(:timeout, :lockdownScore)
    end
end
