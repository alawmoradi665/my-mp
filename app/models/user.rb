class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  has_many :listings, dependent: :destroy

  protected
    def confirmation_required?
      false
    end
end
