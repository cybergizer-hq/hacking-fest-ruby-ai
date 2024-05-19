class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server
      .broadcast "chat_room_channel",
      {
        message: data["message"],
        emo:emo_eval_message(data["message"]&.emo_eval),
        sent_by: data["name"]
      }
  end

  def announce(data)
    ActionCable.server
      .broadcast "chat_room_channel",
      {
        chat_room_name: data["name"],
        emo:emo_eval_message(data["message"]&.emo_eval),
        type: data["type"]
      }
  end

  private

  def emo_eval_message(message_eval = nil)
    if message_eval
      return '🙋' if message_eval < 0.33
      return '😐' if message_eval >= 0.33 && message_eval < 0.66
      return '😎' if message_eval >= 0.66
    end
  end
end
