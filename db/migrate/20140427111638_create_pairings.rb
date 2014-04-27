class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.datetime :timeout
      t.integer :lockdownScore

      t.timestamps
    end
  end
end
