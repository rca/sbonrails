class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.date :the_date
      t.integer :user_d

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
