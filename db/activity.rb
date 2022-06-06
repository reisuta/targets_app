30.times do |n|
  Activity.create!(
    title: Faker::ProgrammingLanguage.name,
    leader_name: Faker::Name.name,
    amount: Faker::Number.number(digits: 5),
    is_secret: Faker::Boolean.boolean,
    suggestion_summary: Faker::Book.title,
    suggestion_detail: Faker::Quote.famous_last_words,
    comment: Faker::ProgrammingLanguage.creator,
    started_at: Faker::Time.between(from: DateTime.now - 5, to: DateTime.now),
    ended_at: Faker::Time.between(from: DateTime.now + 5, to: DateTime.now + 20)
  )
end
