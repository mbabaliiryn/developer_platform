class ChatsController < ApplicationController
    def create
        @chat = Chat.new
        @recipient_id = chat_params
        if @chat.save
          respond_to do |format|
            format.js { render partial: 'notice/alerts', locals: { test: @recipient_id } }
          end
        else
          flash[:alert] = 'You chat session was not created'
        end
      end
    
      private
    
      def chat_params
        params.require(:id)
      end
end
