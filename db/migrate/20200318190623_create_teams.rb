class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name

      t.integer :goals_scored, default: 0
      t.integer :goals_against, default: 0
      t.integer :points, default: 0

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
