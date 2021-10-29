class Reservation < ApplicationRecord
  validate :end_after_start
  validates :start_date, :end_date, :presence => true
  
  belongs_to :user 
  belongs_to :listing

  private

  def end_after_start
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "must be before end time") unless start_date < end_date
  end
end
