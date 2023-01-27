import groovy.io.FileType

    def path = '/home/scripts/'
    def file = 'file'
    def script = 'jobscript.sh'

    def logic= new logic(path,file,script)

    //Buscar fichero
    println 'Buscando fichero -> ' + logic.getFullPath()

    if (logic.searchFile()){
        println '\nFichero existe'
        def exec =  logic.executeScript()
        println exec
        logic.setName()
     }else{
        println 'No hay'
    }
