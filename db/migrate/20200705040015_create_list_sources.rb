class CreateListSources < ActiveRecord::Migration[6.0]
  def change
    create_table :list_sources do |t|
      t.references :source, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
