# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def add_comments(issue_id, count)
  (1..count).each do |n|
    Comment.create(body: "COMMENT #{n} TEXT", user_id: User.all.sample.id, issue_id: issue_id, created_at: (count+1-n).minutes.ago)
  end
end

User.create(email: "nadrajak@cvut.cz", name: "Jakub", password: "123456", password_confirmation: "123456")
User.create(email: "david@cvut.cz", name: "David", password: "123456", password_confirmation: "123456")
User.create(email: "tester@cvut.cz", name: "Tester", password: "123456", password_confirmation: "123456")


Issue.create(title: "Můj první issue", priority: "High", status: "New", body: "Ano, toto je doopravdy můj první issue.", author_id: User.first.id, created_at: (1.23).hours.ago)
Issue.create(title: "Issue 2", priority: "Medium", status: "New", body: "Druhý issue, už ne tak urgentní", author_id: User.first.id, created_at: (0.5).hours.ago)
Issue.create(title: "HMMMMMMMMM", priority: "Low", status: "New", body: "Třetí issue...", author_id: User.first.id)
Issue.create(title: "Issue update tracking bug", priority: "Low", status: "New", body: "We can detect when the body was changed, but its weird with seeded issues, the first edit will always 'update' the body for some reason.", author_id: User.first.id)


Issue.create(title: "TEST 1", priority: "High", status: "Progress", body: "SOME TEXT HERE", author_id: User.last.id, assignee_id: User.all.sample.id, created_at: (50.8).hours.ago)
add_comments(Issue.last.id, 5)
Issue.create(title: "TEST 2", priority: "Low", status: "Progress", body: "SOME TEXT HERE, MAYBE?", author_id: User.last.id, assignee_id: User.all.sample.id, created_at: (25.6).hours.ago)
add_comments(Issue.last.id, 3)
Issue.create(title: "TEST 3", priority: "Low", status: "Done", body: "MAYBE EVEN HERE!", author_id: User.last.id, assignee_id: User.all.sample.id, created_at: (8).hours.ago)
add_comments(Issue.last.id, 1)
Issue.create(title: "TEST 4", priority: "Medium", status: "Done", body: "...?", author_id: User.last.id, assignee_id: User.all.sample.id, created_at: (4).hours.ago)
add_comments(Issue.last.id, 1)