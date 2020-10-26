class Post < ActiveRecord::Base


validates :title, presence: true
validates :content, length: {minimum: 250}
validates :summary, length: {maximum: 250}
validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
validate :clickbaity_method

def clickbaity_method
    if Post.title.valid?
end



end
