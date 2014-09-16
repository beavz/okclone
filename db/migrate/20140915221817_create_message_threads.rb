class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|
      t.integer :user_id_1
      t.integer :user_id_2
      t.timestamps
    end
  end
end
