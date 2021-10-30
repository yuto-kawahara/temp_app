class MessagesController < ApplicationController
  def index
  end

  def create
  end

  def show
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
