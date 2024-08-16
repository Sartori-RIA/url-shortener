# frozen_string_literal: true

FactoryBot.define do
  factory :shortener do
    url { 'http://google.com' }
    visits { 1 }
    short_url { 'MyString' }
  end
end
