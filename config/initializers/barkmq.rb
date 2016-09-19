topic_namespace = [ Rails.env, 'todone' ].join('-')
queue_name = [ Rails.env, 'todone' ].join('-')

BarkMQ.publisher_config do |c|
  c.logger = Rails.logger
  c.topic_namespace = topic_namespace

  c.error_handler = BarkMQ::Handlers::DefaultError.new namespace: 'publisher',
                                                       logger: Rails.logger
end

BarkMQ.subscriber_config do |c|
  c.logger = Rails.logger
  c.topic_namespace = topic_namespace
  c.queue_name = queue_name
end