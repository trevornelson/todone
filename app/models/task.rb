class Task < ActiveRecord::Base
  belongs_to :user

  before_save :move_to_last_position

  acts_as_publisher on: [ :create ]

  after_publish :publish_task, topic: 'todone',
                                on: [ :create ],
                                error: publish_task_error,
                                complete: Proc.new { puts "complete: " }

  def publish_task
    self.publish_to_sns('todone')
  end

  def publish_task_error
    Rails.logger.error "Publish task failed. error=#{error.inspect}"
  end

  def move_to_last_position
    self.order ||= user.tasks.where(completed: false).where(archived: false).count + 1
  end

  def mark_complete
    self.completed = true
    self.order = nil
    self.move_to_last_position
  end

  def analyze
  end
end