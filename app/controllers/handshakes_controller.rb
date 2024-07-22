class HandshakesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_handshake, only: %i[show update]
  before_action :authorize_receiver!, only: %i[update]

  def index
    @handshakes = current_user.received_handshakes
    render json: @handshakes, include: :sender
  end

  def show
    render json: @handshake, include: :sender
  end

  def create
    @handshake = current_user.sent_handshakes.build(receiver_id: params[:receiver_id], status: 'pending')
    if @handshake.save
      render json: @handshake, status: :created
    else
      render json: @handshake.errors, status: :unprocessable_entity
    end
  end

  def update

    if @handshake.update(status: params[:status])
      render json: @handshake
    else
      render json: @handshake.errors, status: :unprocessable_entity
    end
  end

  private

  def find_handshake
    @handshake = Handshake.find(params[:id])
  end

  def authorize_receiver!
    unless @handshake.receiver == current_user
      render json: { error: 'You cannot update this handshake' }, status: :forbidden
    end
  end
end
