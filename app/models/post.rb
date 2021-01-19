class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(fiction non-fiction), 
       message: "%{value} not a valid category. Category must either be Fiction or Non-Fiction."}
    validates :title_must_be_clickbait, presence: true

    def title_must_be_clickbait 
        if title && title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "Must be clickbait-y")
        end 
    end 
end
