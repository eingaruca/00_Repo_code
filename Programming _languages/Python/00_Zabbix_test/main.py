from menu import MenuOptions
#from zabbixConn import *
def sub_menu_1():
    sub_ans=True
    while sub_ans:
        print ("""
        Seleccione una opción:
        ======================
        1. Basic Information
        2. Add Template
        3. Add HostGroup
        4. Add Extra monitorization
        5. Check Information before Add Host
        6. Add Host
        7. Exit/Quit
        """)
        sub_ans=input("Opción: ")
        if sub_ans=="1": 
            #host_name=input("Hostname: ")
            print("1")
        elif sub_ans=="2":
            print("2")
        elif sub_ans=="3":
            print("3")
        elif sub_ans=="4":
            print("4")
        elif sub_ans=="5":
            print("5")
        elif sub_ans=="6":
            print("6")
        elif sub_ans=="7":
            sub_ans=False
            print("\n Goodbye") 
        #elif ans !="" :
        else :
            sub_ans=True
            print("\n Opción NO válida") 


def show_main_menu():
    zapi = MenuOptions.getConnection()
    ans=True
    while ans:
        print ("""
        Seleccione una opción:
        ======================
        1. Add Host
        2. List Hosts
        3. List Hosts Groups
        4. Exit/Quit
        """)
        ans=input("Opción: ")
        if ans=="1": 
            #host_name=input("Hostname: ")
            #MenuOptions.add_host()
            sub_menu_1()
        elif ans=="2":
            MenuOptions.listHosts(zapi)
        elif ans=="3":
            MenuOptions.listHostGroups(zapi)
        elif ans=="4":
            ans=False
            print("\n Goodbye") 
        #elif ans !="" :
        else :
            ans=True
            print("\n Opción NO válida") 


show_main_menu()