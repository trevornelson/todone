class TaskWorker
  include Sidekiq::Worker
  include BarkMQ::Subscriber

  barkmq_subscriber_options topics: [ "todone" ]

  def perform topic, message
    task = Task.find_by(id: message['task']['id'])
    task.delay(queue: 'todone').analyze
  end
end