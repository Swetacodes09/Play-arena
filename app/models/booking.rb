class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sport


  validates :date, :start_time, :end_time, presence: true
  validate :no_double_booking

  def no_double_booking
    overlapping_bookings = Booking.where(sport_id: sport_id, date: date)
                                  .where('start_time < ? AND end_time > ?', end_time, start_time)
    if overlapping_bookings.exists?
      errors.add(:base, 'This time slot is already booked')
    end
  end
end
