# frozen_string_literal: true

class Shortener < ApplicationRecord
  validates_url_format_of :url

  validates :short_url, presence: true, uniqueness: true

  before_validation :set_short_url, only: :create

  scope :with_more_access, -> { order(visits: :desc).limit(100) }

  protected

  def set_short_url
     self.short_url = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten.sample


    return unless Shortener.where(short_url:).any?

    set_short_url
  end
end
