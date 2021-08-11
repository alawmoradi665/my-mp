class Listing < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    validates :price, presence: true
    validates :title, presence: true
    validates :images, presence: true
    validates :state, presence: true
    validates :city, presence: true
    before_validation :validate_title
    before_save :remove_whitespace

    resourcify
  
# Custom sanitisation in creating listings 
    def validate_title
      if self.title.length < 3
        errors.add :base, :invalid, message: "The title is invalid"
      end
    end
  
    def remove_whitespace
      self.title = self.title.strip
      self.description = self.description.strip
    end
end

