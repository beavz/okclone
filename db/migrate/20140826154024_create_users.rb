class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :session_token,   null: false, unique: true
      t.string  :password_digest, null: false
      t.string  :username,        null: false, unique: true
      t.string  :email,           null: false, unique: true
      t.integer :age
      t.integer :zip_code
      t.integer :gender
      t.integer :orientation,       default: 0
      t.integer :ethnicity,         default: 0
      t.integer :height
      t.integer :body_type,         default: 0
      t.integer :diet,              default: 0
      t.integer :smokes,            default: 0
      t.integer :drinks,            default: 0
      t.integer :drugs,             default: 0
      t.integer :religion,          default: 0
      t.integer :sign,              default: 0
      t.integer :education,         default: 0
      t.integer :job,               default: 0
      t.integer :income,            default: 0
      t.integer :relationship_status, default: 0
      t.integer :relationship_type, default: 0
      t.integer :offspring,         default: 0
      t.integer :pets,              default: 0
      t.integer :min_age
      t.integer :max_age
      t.integer :looking_for_status, default: 0
      t.boolean :is_looking_for_men
      t.boolean :is_looking_for_women
      t.boolean :is_looking_for_friends
      t.boolean :is_looking_for_ltdating
      t.boolean :is_looking_for_stdating
      t.boolean :is_looking_for_sexitimes
      t.text    :essay1, default: ""
      t.text    :essay2, default: ""
      t.text    :essay3, default: ""
      t.text    :essay4, default: ""
      t.text    :essay5, default: ""
      t.text    :essay6, default: ""
      t.text    :essay7, default: ""
      t.text    :essay8, default: ""

      t.timestamps
    end

    add_index :users, :username
    add_index :users, :email
  end
end
