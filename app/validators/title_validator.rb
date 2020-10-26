class TitleValidator < ActiveModel::Validator
    def validate(record)
        if record.title 
            unless record.title.include?("Won't Believe" || "Secret" || "Guess"|| "Top [number]")
                record.errors[:title] << "We do not allow that title."
            end
        end
    end

end
