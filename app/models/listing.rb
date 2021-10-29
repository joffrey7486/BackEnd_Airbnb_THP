class Listing < ApplicationRecord
  validates :available_beds, :price,
    presence: true,
    numericality: { greater_than: 0, message: "Doit être supérieur à 0" }   

  validates :description,
    presence: true,
    length: { minimum: 140 }

  validates :welcome_message,
    presence: true

  belongs_to :city 
  belongs_to :user
  has_many :reservations
  end

