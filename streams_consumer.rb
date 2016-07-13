include Java
Dir["/opt/mapr/lib/\*.jar"].each { |jar| require jar }

java_import com.google.common.io.Resources
import org.apache.kafka.clients.consumer.ConsumerRecord
import org.apache.kafka.clients.consumer.ConsumerRecords
import org.apache.kafka.clients.consumer.KafkaConsumer
import org.apache.kafka.clients.producer.KafkaProducer

import java.io.IOException
import java.io.InputStream
import java.util.Arrays
import java.util.Properties

TOPIC_FAST_MESSAGES = "/sample-stream:fast-messages"

props = Resources.get_resource("consumer.props").open_stream()
properties = Properties.new
properties.load(props)
consumer = KafkaConsumer.new(properties)

consumer.subscribe(Arrays.as_list(TOPIC_FAST_MESSAGES))
timeouts = 0
loop do
  records = consumer.poll(200)
  if records.count() == 0
    timeouts += 1
  else
    puts "Got #{records.count()} records after #{timeouts} timeouts"
    timeouts = 0
    records.each do |record|
      puts "Received Message on topic #{record.topic}:\n\t#{record.value}"
    end
  end
end
