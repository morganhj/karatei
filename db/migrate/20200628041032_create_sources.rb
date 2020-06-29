class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :url
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
