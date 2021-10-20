class CreatePlayerScores < ActiveRecord::Migration[6.1]
  def change
    create_table :player_scores do |t|
      t.string :scoreid
      t.string :playername
      t.integer :score
      t.datetime :time

      t.timestamps
    end
  end
end
