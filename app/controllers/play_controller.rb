class PlayController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :index }
    end
  end

  def whatsMyChannel
    channel=current_player.pairings.where("`timeout` > ?",Time.now).first
    respond_to do |format|
      format.json { render json: channel.id.to_json}
      format.html { render json: channel.id.to_json}
    end
  end
end
