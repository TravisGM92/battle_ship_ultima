# frozen_string_literal: true

class CreateCell < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.string :coordinate
      t.string :state
    end
  end
end
