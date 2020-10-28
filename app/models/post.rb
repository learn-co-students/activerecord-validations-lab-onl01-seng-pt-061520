class Post < ActiveRecord::Base
  validates :title, presence: true, exclusion: {in: ["True Facts"]}
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 30}
  validates :category, inclusion: {in: %w(Fiction)}
end
