class CreatePairingsPlayers < ActiveRecord::Migration
  def change
    create_table :pairings_players do |t|
      t.references :pairing, index: true
      t.references :player, index: true

      t.timestamps
    end
  end
end
