# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @shortener = Shortener.find_by(short_url: params[:url])
    if @shortener.present?
      Shortener.increment_counter(:visits, @shortener.id)
      redirect_to @shortener.url, allow_other_host: true
    else
      render json: { error: 'Invalid URL' }
    end
  end
end
