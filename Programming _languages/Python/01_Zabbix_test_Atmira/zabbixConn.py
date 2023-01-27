import configparser, os, sys, logging, datetime
from pyzabbix.api import ZabbixAPI

class ZabbixConn:

    def getConnection():
        path = os.path.join(os.path.dirname(__file__),'parameters.ini')
        config = configparser.ConfigParser()
        config.read(path)
        
        server = config['CREDENTIALS']['server']
        user = config['CREDENTIALS']['user']
        password = config['CREDENTIALS']['password']
        
        url = "http://" + server + "/zabbix/"

        zapi = ZabbixAPI(url=url,user=user,password=password)
        
        return zapi

    def getHostGroups(zapi):
        #result = zapi.hostgroup.get(monitored_hosts=1, output='extend')
        result = zapi.hostgroup.get(output='extend')
        return result

    def getHosts(zapi):
        result = zapi.host.get(monitored_hosts=1, output='extend')
        #hostnames1 = [host['host'] for host in result1]
        return result

    def getHostByHostGroup(zapi,id):
        return 0