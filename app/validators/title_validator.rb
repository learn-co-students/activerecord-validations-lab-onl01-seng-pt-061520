class TitleValidator < ActiveModel::Validator
    def validate(record)
       if record.title 
        unless record.title.include?("Won't Believe" || "Secret" || "Guess"|| "Top [number]")
            record.errors[:title] << "That Title Is Not Clickbait"
      end
    end
  end
end