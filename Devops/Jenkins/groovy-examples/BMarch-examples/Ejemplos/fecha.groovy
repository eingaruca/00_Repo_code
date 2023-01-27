def now = new Date()
println now.format("yyMMdd.HHmm", TimeZone.getTimeZone('UTC'))

//Con errores
String resultado = "echo date -d '\${data}' '+%d%m%Y'".execute().text
def date = new Date().parse("ddMMyyy",resultado)
println date
def formattedDate = date.format("dd/MM/yyy")
prinln formattedDate