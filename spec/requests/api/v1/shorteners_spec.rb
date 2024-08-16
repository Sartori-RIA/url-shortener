# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ShortenersController, type: :request do

  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Shortener.create! valid_attributes
      get shorteners_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      shortener = Shortener.create! valid_attributes
      get shortener_url(shortener), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Shortener' do
        expect do
          post shorteners_url,
               params: { shortener: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Shortener, :count).by(1)
      end

      it 'renders a JSON response with the new shortener' do
        post shorteners_url,
             params: { shortener: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Shortener' do
        expect do
          post shorteners_url,
               params: { shortener: invalid_attributes }, as: :json
        end.not_to change(Shortener, :count)
      end

      it 'renders a JSON response with errors for the new shortener' do
        post shorteners_url,
             params: { shortener: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested shortener' do
        shortener = Shortener.create! valid_attributes
        patch shortener_url(shortener),
              params: { shortener: new_attributes }, headers: valid_headers, as: :json
        shortener.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the shortener' do
        shortener = Shortener.create! valid_attributes
        patch shortener_url(shortener),
              params: { shortener: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the shortener' do
        shortener = Shortener.create! valid_attributes
        patch shortener_url(shortener),
              params: { shortener: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested shortener' do
      shortener = Shortener.create! valid_attributes
      expect do
        delete shortener_url(shortener), headers: valid_headers, as: :json
      end.to change(Shortener, :count).by(-1)
    end
  end
end
