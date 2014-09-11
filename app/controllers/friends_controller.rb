class FriendsController < ApplicationController
  respond_to :html, :json

  def index
    @friend = Friend.all
    respond_with(@friends) do |format|
      format.json { render json: @friend.as_json }
      format.html
    end
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      render json: @friend.as_json, status: :ok
    else
      render json: {friend: @friend.errors}, status: :no_content
    end
  end

  private

  def friend_params
    params.fetch(:friend, {}).permit(:first_name, :last_name, :email, :phone)
  end
end
