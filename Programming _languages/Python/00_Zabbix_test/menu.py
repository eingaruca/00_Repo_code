from zabbixConn import *

class MenuOptions:

    def add_host():
        zapi = ZabbixConn.getConnection()
        #result1 = zapi.host.get(monitored_hosts=1, output='extend')
        result = ZabbixConn.getHosts(zapi)
        print(result)

    def getConnection():
        return ZabbixConn.getConnection()

    def listHostGroups(zapi):
        result = ZabbixConn.getHostGroups(zapi)
        hostGroupsID,hostGroupName = [host['groupid'] for host in result],[host['name'] for host in result]
        print("HostGroups")
        for id,name in zip(hostGroupsID,hostGroupName):
            print(id, " " ,name)

    def listHosts(zapi):
        result = ZabbixConn.getHosts(zapi)
        hostID,hostName = [host['hostid'] for host in result], [host['host'] for host in result]
        print("Hosts")
        for id,name in zip(hostID,hostName):
            print(id, " - " ,name)


