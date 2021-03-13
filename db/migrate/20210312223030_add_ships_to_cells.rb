# frozen_string_literal: true

class AddShipsToCells < ActiveRecord::Migration[5.2]
  def change
    add_reference :cells, :ship, foreign_key: true
  end
end
