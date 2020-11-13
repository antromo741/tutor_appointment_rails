class Appointment < ApplicationRecord
  belongs_to :tutor
  belongs_to :student
  validates :start_time, :end_time, :location, presence: true
  validate :tutor_double_booked, :student_double_booked, :ends_after_it_starts
  #trying to prevent double booking 
  def tutor_double_booked
    lesson_start = self.start_time
    lesson_end = self.end_time
    overlap = tutor.appointments.any? do |appointment|
      check_start = appointment.start_time
      check_end = appointment.end_time
      check_start < lesson_end && lesson_end < check_end || check_start < lesson_start && lesson_start < check_end
      end
      if overlap
        errors.add(:tutor, 'there is a conflictiong appointment')
    end
  end

  def student_double_booked
    lesson_start = self.start_time
    lesson_end = self.end_time
    overlap = tutor.appointments.any? do |appointment|
      check_start = appointment.start_time
      check_end = appointment.end_time
      check_start < lesson_end && lesson_end < check_end || check_start < lesson_start && lesson_start < check_end
    end
    if overlap
      errors.add(:student, 'there is a conflictiong appointment')
    end
  end

  def ends_after_it_starts
   if start_time > end_time
    errors.add(:start_time, 'must be before the end time')
  end
end
#setup a location validation

  def tutor_name
    self.tutor.name
  end

  def student_name
    self.student.name
  end

end
