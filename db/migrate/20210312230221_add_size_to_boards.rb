# frozen_string_literal: true

class AddSizeToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :size, :string
  end
end
