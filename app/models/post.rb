require 'pry'
class Post < ActiveRecord::Base
    
    validates :title, presence: true
    validates :title, format: { with: /Won't|Believe|Secret|Top|Guess/}
    validates(:content, {:length => {:minimum => 250}}) 
    validates(:summary, { :length => {:maximum => 250}})
    validates(:category, {:inclusion => {:in => %w(Fiction Non-Fiction)}})
    # validate :is_clickbait?

    # @@clickbait_words = ["Won't Believe", "Secret", "Top", "Guess"]
    # def is_clickbait?
    #     #binding.pry
    #     @@clickbait_words.each do |word|
    #         if title.include?(word)
    #             return
    #         end
    #     end
    #     errors.add(:title, "must use clickbait words.")
    # end
end
