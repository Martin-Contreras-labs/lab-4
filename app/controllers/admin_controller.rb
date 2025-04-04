class AdminController < ApplicationController
    def delete_all_users
      User.delete_all
      redirect_to users_path, notice: "Todos los usuarios fueron eliminados."
    end
  
    def delete_all_chats
      Message.delete_all
      Conversation.delete_all
      redirect_to users_path, notice: "Todos los chats fueron eliminados."
    end
  end
  