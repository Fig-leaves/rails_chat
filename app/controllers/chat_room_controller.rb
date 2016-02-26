class ChatRoomController < ApplicationController
  def index
    logger.debug params
    @message = Message.new
    @messages = Message.where(room_id: params[:room_id])
    @room_num = params[:room_id]
    
  end

  def send_message
    @message = Message.new(message_params)
    message = @message.content + " by  " + @message.name

    if @message.save
        render json: {status: "success", content: message}
    else
        render json: {status: "failed"}
    end

  end

  private
    def message_params
      params.require(:message).permit(:name, :content, :room_id)
    end

end
