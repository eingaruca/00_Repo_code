import groovy.io.FileType


def list = []
def dir = new File("/home/scripts")
dir.eachFileRecurse (FileType.FILES) { file ->
  list << file
  print file.toString
}