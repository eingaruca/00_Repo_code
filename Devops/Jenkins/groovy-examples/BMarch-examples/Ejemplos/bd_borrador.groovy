import groovy.sql.Sql
import java.sql.DriverManager

DriverManager.registerDriver(new com.mysql.jdbc.Driver())



//using DriverManager 
import java.sql.DriverManager

DriverManager.registerDriver(new com.mysql.jdbc.Driver())


//Using Class.forName -> Kind of a hack, but you can also dynamically load the driver's class:
Class.forName('com.mysql.jdbc.Driver')

//GrrovyGrape
@Grab('mysql:mysql-connector-java:5.1.39')
@GrabConfig(systemClassLoader=true)


////////////////
import groovy.sql.*

inicio()

@Grapes([
@Grab('mysql:mysql-connector-java:5.1.12'),
@GrabConfig(systemClassLoader=true)
])
def inicio(){
        if(args){
               
                def usuario=args[0]
                println "bienvenido: ${usuario}"
                Sql sql=Sql.newInstance("jdbc:mysql://localhost/test",usuario,"5432","com.mysql.jdbc.Driver")
                sql.eachRow("select * from persona") {
                        println "Usuarios de la base: ${it.nombre}"
                }
       
        }else{
                println "error, debes introducir tu nombre"
        }
}



///////////////////////
//wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.30.tar.gz. -O /tmp/mysql-connector.tar.gz 


import groovy.sql.*

inicio()

def inicio(){


    Class.forName("com.mysql.cj.jdbc.Driver")
    def sql = Sql.newInstance("jdbc:mysql://192.168.1.17:3306/dbprueba", "root","rppt", "com.mysql.cj.jdbc.Driver")
    def rows = sql.execute "select count(*) from prueba;"
    echo rows.dump()
               
               /* Sql sql=Sql.newInstance("jdbc:mysql://192.168.1.17:3306/dbprueba","root","root","com.mysql.jdbc.Driver")
                sql.eachRow("select * from prueba") {
                        println "Usuarios de la base: ${it.nombre}"
                }*/

}



@Grapes([
    @Grab('mysql:mysql-connector-java:8.0.30')
])

import groovy.sql.Sql

def sql = Sql.newInstance(
    'jdbc:mysql://192.168.1.17/dbprueba', 
    'root',
    'root', 
    'com.mysql.jdbc.Driver'
);

//////////////
import groovy.sql.*
//def sql = Sql.newInstance("jdbc:mysql://192.168.1.17:3306/dbprueba", "root","root", "com.mysql.jdbc.Driver")
  	def sql = Sql.newInstance("jdbc:mysql://192.168.1.17:3306/dbprueba", "root","root", "com.mysql.cj.jdbc.Driver")
    def rows = sql.execute "select count(*) from prueba;"
    echo rows.dump()


        FreeStyleProject p = j.jenkins.createProject(FreeStyleProject.class, "somejob");
        DataSource ds = PerItemDatabaseConfiguration.find().getDataSource(p);
        Connection con = ds.getConnection();

//////////ORACLE

        import groovy.sql.Sql;

 	def classLoader = ClassLoader.systemClassLoader
    while (classLoader.parent) {
        classLoader = classLoader.parent
    }
    classLoader.addURL(new File("/opt/oracle/product/11.2.0/client/jdbc/lib/ojdbc6.jar").toURL())
    def sql = Sql.newInstance('jdbc:oracle:thin:@SERVER:2483/INSTANCE', 'USER', 'PASSWORD', 'oracle.jdbc.OracleDriver')
    sql.execute 'select 1 from dual'
    sql.close()