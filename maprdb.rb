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
if (!MapRDB.tableExists(tableName))
  puts "Table Doesn't exist, creating"
  table = MapRDB.createTable(tableName)
else
  puts "Table exists"
  table = MapRDB.getTable(tableName)
end

document = MapRDB.newDocument()
.set("_id", "jdoe")
.set("first_name", "John")
.set("last_name", "Doe")
.set("dob", ODate.parse("1970-06-23"))

table.insertOrReplace(document)

record = table.findById("jdoe")
puts record.inspect