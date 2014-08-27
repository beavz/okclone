class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text     :text,     null: false, unique: true
      t.integer  :category, null: false

      t.timestamps
    end

    add_index :questions, :category
  end
end
