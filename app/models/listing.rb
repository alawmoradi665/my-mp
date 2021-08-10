class Listing < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    validates :price, presence: true
    validates :title, presence: true
    validates :images, presence: true
    validates :state, presence: true
    validates :city, presence: true
end
