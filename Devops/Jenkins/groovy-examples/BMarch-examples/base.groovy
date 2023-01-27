import groovy.io.FileType

//Variables

def metodos = new metodos()

def linea = "================================================================================"
def path = '/home/scripts/'
fecha = obtenerFecha()
def filename = 'file' +fecha
println linea
println "Comprobamos llegada del fichero: " + path + filename

File file = new File(path + filename)
if(file.exists()){
  println "Existe fichero, ejecutamos script Jobscript"
  String resultado = (path+"jobscript.sh").execute().text
  String script = "cat /home/scripts/jobscript.sh".execute().text
  println script
  println linea
    println resultado
  println "Cambiamos de nombre"
  cambiarNombre(file,file.name + "_OK") 
}else{
 println "No existe el fichero"
}
println linea

//===============================================================
//======================= MÉTODOS ===============================
//===============================================================

def obtenerFecha(){
     now  = new Date()
     fecha=now.format("ddMMyy", TimeZone.getTimeZone('UTC'))
     println "Fecha:" + fecha
     return fecha
}

def cambiarNombre(fichero, newname){
  	fichero.renameTo(new File('/home/scripts/', newname))
    println "Nuevo nombre fichero: " + fichero
}