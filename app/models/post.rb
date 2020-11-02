class Post < ActiveRecord::Base
    validates :title, presence: true
    validates(:content, {:length => {:minimum => 250}}) 
    validates(:summary, { :length => {:maximum => 250}})
    validates(:category, {:inclusion => {:in => %w(Fiction Non-Fiction)}})
    validate :is_clickbait?

    clickbait_words = ["Won't Believe", "Secret", "Top", "Guess"]
    def is_clickbait?
        if :title.exclude?(clickbait_words)
            errors.add(:title, "must use clickbait words.")
        end
    end
end
