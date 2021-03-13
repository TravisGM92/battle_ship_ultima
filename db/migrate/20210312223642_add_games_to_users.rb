# frozen_string_literal: true

class AddGamesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :game, foreign_key: true
  end
end
