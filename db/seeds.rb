include RandomData

# Create Posts
50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# idempotence -> adding constant things
unique_post = Post.create(
  title: "#####",
  body: "bodybodybody"
)

Post.find_or_create_by(title: '#####')



# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
