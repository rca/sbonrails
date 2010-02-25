class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.string :title
      t.integer :presenter_id
      t.integer :owner_id
      t.integer :location_id
      t.datetime :date
      t.string :state, :default => 'idea'
      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
  end
end

