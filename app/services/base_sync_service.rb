class BaseSyncService
  class << self
    def client
      @@client ||= MLB::Client.new
    end

    protected

    def sync_using(client_method, *args, klass, &block)
      incoming_objects = client.send client_method, *args
      incoming_objects.try :each do |incoming_object|
        object = klass.find_or_initialize_by(external_id: incoming_object['id'])
        block.call(object, incoming_object)
        object.save
      end
    end
  end
end
