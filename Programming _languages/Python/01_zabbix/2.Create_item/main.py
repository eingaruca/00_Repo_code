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
#result1 = zapi.host.get(groupids="4",output='extend')
#print(result1)
#hostid = zapi.host.create({ 'host': "host_name", 'dns' : "host_name",'ip' : '192.168.11.11','groups': [{"groupid":1}]})['hostids'][0]
"""
zapi.do_request('host.create',
                          {
                              "host": "Linux_server",
                              "interfaces": [             
                                    {
                                        "type": 1,
                                        "main": 1,
                                        "useip": 1,
                                        "ip": "192.168.1.11",
                                        "dns": "",
                                        "port": "10050"
                                    }
                                ],
                               "groups": [
                                
                                    {
                                        "groupid": "50"
                                    }
                                ],
                                "templates": [
                                    {
                                        "templateid": "20045"
                                    }
                                ],
                                "inventory_mode": 0,
                                "inventory": {
                                    "macaddress_a": "01234",
                                    "macaddress_b": "56768"
                                }
                          })
"""

host = zapi.host.create(
    host="linux_sadasdx",
    description="Descripción",
    inventory_mode=1,  # auto host inventory population
    status=0,  # monitored host
    groups=[{
        'groupid':'4'
        }],
    interfaces=[ {"type": "1",
             "main": "1",
             "useip": "1", 
             "ip": "127.0.0.1",
             "dns": "mydns", # can be blank
             "port": "10051"}],  
)

print(host)