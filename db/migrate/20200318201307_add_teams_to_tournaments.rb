class AddTeamsToTournaments < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :teams, :tournament, null: false, foreign_key: true
  end
end
