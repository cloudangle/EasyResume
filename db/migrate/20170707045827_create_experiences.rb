class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :org
      t.string :desc
      t.string :starttime
      t.string :endtime
      t.string :location
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
