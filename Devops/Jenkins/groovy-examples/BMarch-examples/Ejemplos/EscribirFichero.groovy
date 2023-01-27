    //Write
    File file = new File("out.txt")
    file.write "First line\n"
    file << "Second line\n"
     
    println file.text
    //Append
    File file = new File("out.txt")
    file.append("hello\n")
    println file.text

    //write and append
        File file = new File("out.txt")
    file.write("first\n")
    file.append("second\n")
    file.write("third\n")
     
    println file.text