class CreateAuthTokens < ActiveRecord::Migration
  def change
    create_table :auth_tokens do |t|
      t.string :value
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
