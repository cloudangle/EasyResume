class CreateSelfintros < ActiveRecord::Migration[5.1]
  def change
    create_table :selfintros do |t|
      t.text :content
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
