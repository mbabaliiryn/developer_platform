class NoticeController < ApplicationController
    skip_forgery_protection
    def create
        @notice = current_user.alert_sent.build(notice_params)
        @notice.chat_id = 1
        if @notice.save
          ActionCable.server.broadcast "chat_channel_#{@notice.chat_id}",
                                       message: 'Hello',
                                       sender: @notice.sender,
                                       recipient: @notice.recipient,
                                       notice: @notice,
                                       date: @notice.created_at.strftime('%H:%M,%P,%A'),
                                       image_sender: image_java(@notice.sender),
                                       image_recipient: image_java(@notice.recipient)
        else
          flash[:alert] = 'You message was not sent successfully.'
        end
      end
    
      private
    
      def notice_params
        params.require(:notice).permit(:recipient_id, :body)
      end
    
      def image_java(user)
        return url_for(user.image) if user.image.attached?
    
        ''
      end
end
