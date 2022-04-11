class Booking < ApplicationRecord
    belongs_to :user
    
    validates :name, :number_of_people, :start_time, :end_time, presence: true # Required fields
    validates :end_time, comparison: { greater_than: :start_time }
    validates :start_time, comparison: { greater_than: Date.today }

    validate :validate_other_booking_overlap

    def period
      start_time..end_time
    end
  
    private
    def validate_other_booking_overlap
      other_bookings = Booking.all
      is_overlapping = other_bookings.any? do |other_booking|
        period.overlaps?(other_booking.period)
      end
      errors.add(:Booked!, 'Those dates are already booked, please check the calendar') if is_overlapping
    end
  end