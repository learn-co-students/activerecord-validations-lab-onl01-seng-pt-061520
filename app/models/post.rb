class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :title_needs_to_be_clickbaity

  def title_needs_to_be_clickbaity
    unless title&.match(/(Won't Believe)|(Secret)|(Top)|(Guess)/)
      errors.add(:title, 'needs to be clickbaity')
    end
  end
end
