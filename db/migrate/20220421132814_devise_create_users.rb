# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, comment: 'ユーザー名'
      t.string :email, null: false, comment: 'メールアドレス'
      t.string :encrypted_password, null: false, comment: '暗号化済パスワード'
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
