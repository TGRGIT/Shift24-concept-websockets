class AuthorizationController < WebsocketRails::BaseController
  def authorize_channels
    # The channel name will be passed inside the message Hash
    channel = WebsocketRails[message[:channel]]

    if Pairing.find(channel).players.include?(current_player.id)
      accept_channel current_user
    else
      deny_channel({:message => 'authorization failed!'})
    end
  end
end