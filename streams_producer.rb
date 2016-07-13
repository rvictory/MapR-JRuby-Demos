include Java
Dir["/opt/mapr/lib/\*.jar"].each { |jar| require jar }

java_import com.google.common.io.Resources
java_import org.apache.kafka.clients.producer.KafkaProducer
java_import org.apache.kafka.clients.producer.ProducerRecord

java_import java.io.IOException
java_import java.io.InputStream
java_import java.util.Properties

TOPIC_FAST_MESSAGES = "/sample-stream:fast-messages"

props = Resources.get_resource("producer.props").open_stream()
properties = Properties.new
properties.load(props)
producer = KafkaProducer.new(properties)

100.times do |x|
  producer.send(ProducerRecord.new(TOPIC_FAST_MESSAGES, "This is a message (#{x})"))
end
producer.flush()
producer.close()