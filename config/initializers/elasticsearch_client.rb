Elasticsearch::Model.client = Elasticsearch::Client.new(
  log: true,
  host: ENV['ELASTICSEARCH_HOST'] || 'localhost'
)
