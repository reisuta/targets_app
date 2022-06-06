FactoryBot.define do
  factory :activity do
    requirement_id { '' }
    leader_name { '佐藤' }
    title { '活動テスト' }
    amount { 1000 }
    is_secret { false }
    suggestion_summary { '提案骨子テスト' }
    suggestion_detail { '提案詳細テスト' }
    comment { 'コメントテスト' }
    started_at { '2022-05-01 00:00:00' }
    ended_at { '2023-06-01 00:00:00' }
  end
end
