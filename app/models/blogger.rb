class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, presence: true, uniqueness: true
  validates :bio, length: { minimum: 30 }
  validates :age, length: { minimum: 1 }

  def get_total_likes
    total_likes = 0
    self.posts.each do |post|
      total_likes += post.likes
    end
    total_likes
  end

  def find_featured_post
    if self.posts.nil?
      return "Blogger hasn't posted yet"
    else
      self.posts.group_by {|x| x.likes}.first[1][0]
    end
  end

  def top_destinations
    if !self.destinations.nil?
      destinations = self.posts.map {|x| x.destination.name }
      destinations = destinations.group_by {|x| destinations.count(x)}
      destinations = destinations.map {|x,y| y.uniq}.flatten
    else
      return "Blogger hasn't posted any destinations."
    end
  end

end
