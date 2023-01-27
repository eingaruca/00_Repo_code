import java.sql.Connection
import java.sql.DriverManager
import javax.sql.DataSource
import groovy.sql.Sql
import oracle.jdbc.driver.OracleTypes

sql = Sql.newInstance("jdbc:oracle:thin:@40.121.57.231:1521:xe",
               "system", "oracle", "oracle.jdbc.OracleDriver")



@GrabConfig( systemClassLoader=true )
@Grab ('oracle:ojdbc11.jar')


import java.sql.Connection
import java.sql.DriverManager
import javax.sql.DataSource
import groovy.sql.Sql
import oracle.jdbc.driver.OracleTypes

sql = Sql.newInstance("jdbc:oracle:thin:@40.121.57.231:1521:xe",
               "system", "oracle", "oracle.jdbc.OracleDriver")

               


	import groovy.sql.Sql;
    import java.util.ServiceLoader;
    import java.sql.Driver;

  	def sql = Sql.newInstance("jdbc:mysql://192.168.1.17:3306/dbprueba", "root","root", "com.mysql.cj.jdbc.Driver")
    //def rows = sql.execute "select count(*) from prueba;"
	def rows = sql.execute "insert into prueba values(5,'Jackson','EE.UU');"
	println rows