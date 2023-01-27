import configparser, os, sys, logging
from pyzabbix.api import ZabbixAPI

path = os.path.join(os.path.dirname(__file__), 'parameters.ini')
config = configparser.ConfigParser()
config.read(path)

server = config['DATOS']['server']
user = config['DATOS']['user']
password = config['DATOS']['password']
url = 'http://'+ server +'/zabbix/'

grupo_zabbix="Zabbix server health"
grupo_linux="00 Linux servers"
grupo_windows="00 Windows Servers"

zapi = ZabbixAPI(url=url, user=user, password=password)

#result1 = zapi.host.get(monitored_hosts=1, output='extend')
result1 = zapi.host.get(groupids="4",output='extend')
result2 = zapi.host.get(hostids=["10084", "10539"],output='extend')

"""
result2 = zapi.do_request('host.get',
                          {
                              'filter': {'status': 1},
                              'output': 'extend'
                          })
"""
hostnames1 = [host['host'] for host in result1]
print(hostnames1)
print(result2)



