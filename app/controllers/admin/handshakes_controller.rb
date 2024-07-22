# app/controllers/admin/handshakes_controller.rb
class Admin::HandshakesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @handshakes = Handshake.all
    render json: @handshakes, include: [:sender, :receiver]
  end

  def update
    @handshake = Handshake.find(params[:id])
    if @handshake.update(handshake_params)
      render json: @handshake
    else
      render json: @handshake.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @handshake = Handshake.find(params[:id])
    @handshake.destroy
    head :no_content
  end

  private

  def handshake_params
    params.require(:handshake).permit(:status)
  end
end
