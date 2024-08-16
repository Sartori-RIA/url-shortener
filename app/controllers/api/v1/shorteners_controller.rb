# frozen_string_literal: true

class Api::V1::ShortenersController < ApplicationController
  before_action :set_shortener, only: %i[show update destroy]

  def index
    @shorteners = Shortener.all

    render json: @shorteners
  end

  def show
    render json: @shortener
  end

  def create
    @shortener = Shortener.new(shortener_params)

    if @shortener.save
      render json: @shortener, status: :created
    else
      render json: @shortener.errors, status: :unprocessable_entity
    end
  end

  def update
    if @shortener.update(shortener_params)
      render json: @shortener
    else
      render json: @shortener.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @shortener.destroy!
  end

  private

  def set_shortener
    @shortener = Shortener.find(params[:id])
  end

  def shortener_params
    params.require(:shortener).permit(:url)
  end
end
