# frozen_string_literal: true

class AddUsersToBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :boards, :user, foreign_key: true
  end
end
