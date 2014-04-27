class ChatController < WebsocketRails::BaseController
  include ActionView::Helpers::SanitizeHelper

  def initialize_session
    puts "Session Initialized\n"
  end

  def system_msg(ev, msg)
    broadcast_message ev, {
        user_name: 'system',
        received: Time.now.to_s(:short),
        msg_body: msg
    }
  end

  def user_msg(ev, msg)
    broadcast_message ev, {
        user_name:  'userx',
        received:   Time.now.to_s(:short),
        msg_body:   ERB::Util.html_escape(msg)
    }
  end

  def client_connected
    system_msg :new_message, "client #{client_id} connected"
  end

  def new_message
    user_msg :new_message, message[:msg_body].dup
  end

=begin
  def client_connected
    #system_msg :new_message, "client  connected"
    welcome_msg={
        :message_type=> 'system',
        :info=> "Welcome User!"
    }

    WebsocketRails[message[:channel]].trigger(:new_message, welcome_msg)
  end

  def new_message
    nm_msg={
        :src=> message[:user_name],
        :msg_body=> message[:msg_body]
    }
    WebsocketRails[message[:channel]].trigger(:new_message, nm_msg)
  end
=end


end