class AddDescriptionToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :description, :text
  end

  def self.down
    remove_column :presentations, :description
  end
end

