# frozen_string_literal: true

class CreateShorteners < ActiveRecord::Migration[7.1]
  def change
    create_table :shorteners do |t|
      t.string :url
      t.integer :visits, default: 0
      t.string :short_url

      t.timestamps
    end
    add_index :shorteners, :url
    add_index :shorteners, :short_url
  end
end
