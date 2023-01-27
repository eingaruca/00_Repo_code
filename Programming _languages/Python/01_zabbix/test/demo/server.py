class Server:
    def __init__(self,id_name,name,group):
        self.id_name = id_name
        self.name = name
        self.group = group

    def imprimir(self):
        print(self.name)