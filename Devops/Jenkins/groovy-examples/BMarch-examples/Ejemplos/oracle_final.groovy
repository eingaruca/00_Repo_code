@GrabConfig( systemClassLoader=true )
@Grab("com.oracle.database.jdbc:ojdbc8:19.7.0.0")
@Grab("com.oracle.database.jdbc:ucp:19.7.0.0")


import java.sql.Connection
import java.sql.DriverManager
import javax.sql.DataSource
import groovy.sql.Sql
import oracle.jdbc.driver.OracleTypes

sql = Sql.newInstance("jdbc:oracle:thin:@40.121.57.231:1521:xe",
               "system", "oracle", "oracle.jdbc.OracleDriver")
//def rows = sql.execute "insert into prueba_ora values(3)"

sql.query('SELECT * FROM prueba_ora') { resultSet ->
  while (resultSet.next()) {
    def first = resultSet.getString(1)
    println first
    //def last = resultSet.getString('lastname')
    //assert expected[rowNum++] == "$first $last"
  }
}