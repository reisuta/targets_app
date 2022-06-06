class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :provider, :string, comment: 'プロバイダー名'
    add_column :users, :uid, :string, comment: 'ユーザー識別用文字列'
  end
end
