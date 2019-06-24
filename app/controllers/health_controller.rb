class HealthController < ApplicationController
  def show
    format.json { render status: :ok }
  end
end
