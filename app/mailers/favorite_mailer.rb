class FavoriteMailer < ApplicationMailer
  default from: "djc4ku@virginia.edu"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "comments/#{comment.id}@bloccit-uva.herokuapp.com"
    headers["In-Reply-To"] = "post/#{post.id}@bloccit-uva.herokuapp.com"
    headers["References"] = "post/#{post.id}@bloccit-uva.herokuapp.com"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"] = "posts/#{post.id}@bloccit-uva.herokuapp.com"
    headers["In-Reply-To"] = "post/#{post.id}@bloccit-uva.herokuapp.com"
    headers["References"] = "post/#{post.id}@bloccit-uva.herokuapp.com"

    @post = post

    mail(to: post.user.email, subject: "You're following, #{post.title}!")
  end
end
