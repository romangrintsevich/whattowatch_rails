class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :link
      t.string :priority
      t.text :description

      t.timestamps
    end
  end
end
