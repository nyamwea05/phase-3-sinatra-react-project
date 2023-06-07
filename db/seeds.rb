require 'faker'

# Generate seed data using Faker
10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  
  task = user.tasks.create!(
    text: Faker::Lorem.sentence,
    title: Faker::Lorem.sentence,
    category: Faker::Lorem.word,
    due_date: Faker::Date.forward(days: 30),
    start_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
    end_time: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 2),
    priority: Faker::Number.between(from: 1, to: 5),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    is_complete: Faker::Boolean.boolean,
  )
  users = User.all
users.each do |user|
  5.times do
    user.tasks.create(title: 'Task Title', description: 'Task Description')
  end
end

end