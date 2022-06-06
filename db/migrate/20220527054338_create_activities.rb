class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.bigint :requirement_id, comment: '要件ID'
      t.string :title, null: false, comment: 'タイトル'
      t.string :leader_name, null: false, comment: 'リーダー名'
      t.integer :amount, null: false, comment: '金額'
      t.boolean :is_secret, default: false, null: false, comment: '機密フラグ'
      t.text :suggestion_summary, null: false, comment: '提案骨子'
      t.text :suggestion_detail, null: false, comment: '解決提案詳細'
      t.string :comment, comment: 'コメント'
      t.datetime :started_at, comment: '開始日時'
      t.datetime :ended_at, comment: '終了日時'

      t.timestamps
    end
  end
end
