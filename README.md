# Simple MapR-DB & MapR Streams Examples using JRuby and the native MapR APIs
This project contains example code that I wrote to use the native MapR Streams and MapR-DB libraries in Ruby. The code is adapted from the following projects:
* https://github.com/mapr-demos/mapr-streams-sample-programs
* https://github.com/mapr-demos/maprdb-ojai-101

### Pre-requisites

* Java SDK 7 or newer
* JRuby
* MapR 5.1 Cluster or Sandbox

### Assumptions

* MapR is installed and the libraries are accessible from /opt/mapr/lib
* For the Streams demos, the consumer.props and producer.props files need to be in the same directory as the script that is being run

### Usage

For the Streams demo, the "streams_producer.rb" script will write 100 messages to the Stream, the "streams_consumer.rb" will
read messages from the stream. For MapRDB, make sure that you have the proper user directory made in MapR-FS
(/mapr/<cluster_name/user/`whoami`) and that your permissions are setup properly. The demo will create a table called "Users" and
insert a record, and then retrieve that record.
