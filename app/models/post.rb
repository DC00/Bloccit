class Post < ActiveRecord::Base
  has_many :comments

  def censor_posts
    @Post.all.each_with_index do |item, index|
      if index % 5 == 0
        @Post.at(index).title = "CENSORED"
      end
    end
  end
end
