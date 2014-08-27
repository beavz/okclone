class CreateAcceptableResponses < ActiveRecord::Migration
  def change
    create_table :acceptable_responses do |t|
      t.integer   :user_id,      null: false
      t.integer   :answer_id,    null: false

      t.timestamps
    end

    add_index :acceptable_responses, [:user_id, :answer_id], unique: true
  end
end
