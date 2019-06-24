class HealthController < ApplicationController
  respond_to :json

  def show
    render status: :ok
  end
end
