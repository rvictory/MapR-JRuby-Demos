include Java
Dir["/opt/mapr/lib/\*.jar"].each { |jar| require jar }

java_import com.mapr.db.MapRDB
java_import com.mapr.db.Table
java_import org.ojai.Document
java_import org.ojai.DocumentStream
java_import org.ojai.store.DocumentMutation
java_import org.ojai.store.QueryCondition
java_import org.ojai.store.exceptions.DocumentExistsException
java_import org.ojai.types.ODate

java_import java.io.IOException
java_import java.util.Arrays
java_import java.util.Iterator

java_import org.ojai.store.QueryCondition

tableName = "users"
table = nil
if (!MapRDB.table_exists?(tableName))
  puts "Table Doesn't exist, creating"
  table = MapRDB.create_table(tableName)
else
  puts "Table exists"
  table = MapRDB.get_table(tableName)
end

document = MapRDB.new_document
.set("_id", "jdoe")
.set("first_name", "John")
.set("last_name", "Doe")
.set("dob", ODate.parse("1970-06-23"))

table.insert_or_replace(document)

record = table.find_by_id("jdoe")
puts record.inspect