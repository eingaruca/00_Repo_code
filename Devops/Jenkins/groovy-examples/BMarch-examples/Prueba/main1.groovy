//Variables

public class main1{

    def path = '/home/scripts/'
    def file = 'jobscript.sh'

    def logic= new logic(path,file)

    //Buscar fichero

    println 'Buscando fichero -> ' + logic.fullPath()
    
    if (logic.searchFile())
        println logic.printLine
    else
        println "No hay"   


}