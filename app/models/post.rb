class Post < ActiveRecord::Base
  include ActiveModel::Validations

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction, Non-Fiction) }
  validate :clickbait

  def clickbait
    if title.present?
      string_arr = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      if string_arr.any? { |string| title.exclude?(string) }
        errors.add(:title, "you need the clickbait!")
      end
      binding.pry
    end
  end
end
