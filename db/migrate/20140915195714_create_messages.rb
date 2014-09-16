class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.boolean :read, default: false
      t.integer :thread_id
      t.integer :from_user_id, null: false
      t.integer :to_user_id, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end
