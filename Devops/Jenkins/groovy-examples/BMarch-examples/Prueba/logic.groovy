import groovy.io.FileType

public class logic{

    private def path
    private def file 
    private def script

    public logic (path,file,script){
        this.path = path
        this.file = file
        this.script = script
    }

    def getFullPath(){
        return path + file + getCurrentDate() 
    }

    def getCurrentDate(){
        def now  = new Date()
        def date = now.format("ddMMyy", TimeZone.getTimeZone('UTC'))
        return date
    }

    def setName(){
	    def newname = file + getCurrentDate()  + '_OK'
        getFile().renameTo(new File(path, newname))
        println "Nuevo nombre fichero: " + newname
    }

    def getFile(){
        File file1 = new File(getFullPath())
        return file1
    }

    def searchFile(file1){
        File file2 = getFile()
        return file2.exists()

    }

    def executeScript(){
        def resultado = (path + script).execute().text
        return resultado
    }

     def printLine(){
        println '========================================================================'
    }
}
