class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    private

    def clickbait
        if title.present? && (!title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top /\d/") && !title.include?("Guess"))
            errors.add(:title, "must bait clicks")
        end
    end
end
