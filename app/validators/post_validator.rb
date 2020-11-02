class PostValidator < ActiveModel::Validator
    def validate(record)
        if record.title
            arr = ["Won't Believe","Secret","Top","Guess"]
            result = arr.map{|i| record.title.match?(i)}
            unless result.include?(true)
                record.errors[:post] << "Needs more clickbait"
            end
        else
            record.errors[:post] << "Add a title"
        end
    end
end