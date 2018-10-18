class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def find_recent_posts
    posts = Post.all
    posts = posts[-5...-1].reverse
    posts
  end

  def find_featured_post
    self.posts.group_by {|x| x.likes}.first[1][0]
  end

  def average_age
    bloggers = self.bloggers
    bloggers_ages = bloggers.map {|x| x.age}.reduce(:+)
    bloggers_ages / bloggers.length
  end
end
