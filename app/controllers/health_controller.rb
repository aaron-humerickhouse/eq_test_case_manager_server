class HealthController < ApplicationController
  respond_to :json

  def show
    render json: { status: 'ok' },status: :ok
  end
end
