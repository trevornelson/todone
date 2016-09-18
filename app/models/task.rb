class Task < ActiveRecord::Base
  belongs_to :user

  before_save :move_to_last_position

  def move_to_last_position
    self.order ||= user.tasks.where(completed: false).where(archived: false).count + 1
  end

  def mark_complete
    self.completed = true
    self.order = nil
    self.move_to_last_position
  end
end