# frozen_string_literal: true

class Shortener < ApplicationRecord
  validates_url_format_of :url

  validates :short_url, presence: true

  before_validation :set_short_url, only: :create

  protected

  def set_short_url
    ## TODO
  end
end
