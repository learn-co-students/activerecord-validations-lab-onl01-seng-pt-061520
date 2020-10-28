class PostValidation
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {:maximum 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction) 
    message: "%(value) is not a valid category. Category must be Fiction or Non-Fiction"}
    validate :title_is_click_bait

    def title_is_click_bait
        if title && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess" )
            errors.add(:title, "Must be clickbait")
        end
    end
end
