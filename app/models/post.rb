class Post < ActiveRecord::Base
  has_many :comments

  # self. for class method
  def self.censor_every_fifth_posts
    Post.find_each do |post|
      if post.id % 5 == 0
        post.censor_post
      end
    end
  end

  def censor_post
    post.title = "CENSORED"
    post.save
  end
end
