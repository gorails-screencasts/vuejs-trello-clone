class BoardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "board"
  end

  def unsubscribed
    stop_all_streams
  end
end
