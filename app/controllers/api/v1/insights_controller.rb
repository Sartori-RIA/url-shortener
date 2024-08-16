# frozen_string_literal: true

class Api::V1::InsightsController < ApplicationController
  def index
    @insights = Shortener.with_more_access
    render json: @insights
  end
end
