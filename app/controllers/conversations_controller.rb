class ConversationsController < ApplicationController
  def index
    @user = User.find(params[:user_id]) 
    @conversations = Conversation.where("sender_id = ? OR recipient_id = ?", @user.id, @user.id)
  end
  def create
    sender = User.find(params[:sender_id])
    recipient = User.find(params[:recipient_id])

    
  if sender.nil? || recipient.nil?
    redirect_to users_path, alert: "Usuarios no válidos para iniciar la conversación."
    return
  end

    conversation = Conversation.where(
      sender_id: sender.id, recipient_id: recipient.id
    ).or(
      Conversation.where(sender_id: recipient.id, recipient_id: sender.id)
    ).first

    unless conversation
      conversation = Conversation.create(sender_id: sender.id, recipient_id: recipient.id)
    end

    redirect_to conversation_path(conversation)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.includes(:user).order(:created_at)
  end
end
