class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.boolean :self_assignable
      t.references :coach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
