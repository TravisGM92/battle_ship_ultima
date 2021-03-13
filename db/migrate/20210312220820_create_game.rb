# frozen_string_literal: true

class CreateGame < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :turn_number
    end
  end
end
