import groovy.io.FileType

public class metodos{

    def printLine(){
        println '========================================================================'
    }

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

    def searchFile(){
        
    }



}