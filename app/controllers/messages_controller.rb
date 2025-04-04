class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = 1 # Cambiar por current_user más adelante

    if @message.save
      redirect_to conversation_path(@conversation), notice: "Mensaje enviado."
    else
      redirect_to conversation_path(@conversation), alert: "No se pudo enviar el mensaje."
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end