class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer  :question_id,  null: false
      t.integer  :user_id,      null: false
      t.integer  :answer_id,    null: false
      t.text     :explanation

      t.timestamps
    end

    add_index :responses, [:user_id, :question_id], unique: true
  end
end
