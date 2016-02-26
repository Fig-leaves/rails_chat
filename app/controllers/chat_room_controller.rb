class ChatRoomController < ApplicationController
  def index
    logger.debug params
    @message = Message.find_by(room_id: params[:room_id])
    
  end

  def send_message

  end
end
