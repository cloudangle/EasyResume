class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.text :content
      t.references :detailable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
