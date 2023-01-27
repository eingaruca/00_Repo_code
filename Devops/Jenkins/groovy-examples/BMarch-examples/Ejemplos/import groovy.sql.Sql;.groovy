import groovy.sql.Sql;

 	def classLoader =ClassLoader.systemClassLoader
    while (classLoader.parent) {
        classLoader = classLoader.parent
    }
    classLoader.addURL(new File("/var/jenkins_home/mysql-connector-java-8.0.30.jar").toURL())
    //classLoader.addURL(new File("/var/jenkins_home/mysql-connector-java-8.0.30.jar").toURL())
  	def sql = Sql.newInstance("jdbc:mysql://192.168.1.17:3306/dbprueba", "root","root", "com.mysql.cj.jdbc.Driver")
    sql.execute 'select 1 from dual'
    sql.close()