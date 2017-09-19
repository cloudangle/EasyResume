class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.string :university
      t.string :major
      t.string :enrolledtime
      t.string :gradtime
      t.string :location
      t.references :resume, foreign_key: true

      t.timestamps
    end
  end
end
